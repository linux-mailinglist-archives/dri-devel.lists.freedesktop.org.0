Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGq4E82cqWnGAwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:10:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA056214368
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF8E10E2B7;
	Thu,  5 Mar 2026 15:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eI+ODI7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6413C10E29B;
 Thu,  5 Mar 2026 15:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSVUnVCunyuQJ+T1W+idkFBvRrpSEnR1PCzs4tBdQ/88kducRLboWI9qamppL5sRsDJXGvgGD/I19W9PRm0cBlW/rpGhDCC+XarbWfUUYVBpv4iP4ymXYgTpwCW5dDMVIOPggMiOmzEQywWxyqHWuwwpbvhlmDxKciRVRyVMgL90fV8MnrFOoYLP92jyF+1J3tr0GgjUr34ZKpPF1GfxWwlE9G4gquvR+abfoj/OePd4CmPq6heSFsg8WcMSLXd/CyFDiBTTdBRo+HvJhdewmkFejR9UzpAqwaY5SDo4CUZLwX7911ybYFFgezpBrtbcKgVgNtOJO4kJ4KVGAAuu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfIiPO/0ivh6/PwRtyU0gnhTjRVmVXZGaSqdlm5sR8A=;
 b=woeGu5bNsP5tI4uqjHoiwkUDkydHouYLahTNxTOTC3gXtBFngF3jsi+R8sd9rQ1ZKhJZ0GSAqewt7rdtKrcBnl0f6scSifm0vPrSkeVD0mgq8mAkd+38fH/6/Ynu7MZEGg4+gV17pLJ23KmgNZMTBFXyU5VROZk8e9QErnvy5vYr9ZanPXEd0G/2EueTQVXqlRf8iNm5Om4M4QkdyBIVJ0HG7zBR2r+LYtSnp+vLkFTUeQvODva3Z+meVEErFINSUCAelxyAFN9b0945ObmVFY+aLS7SOBawTt+pqB2AqTc7Lz0nfmaPU/5Lktxu9F9jJGC1n6xHs1zUKzKKl3nYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfIiPO/0ivh6/PwRtyU0gnhTjRVmVXZGaSqdlm5sR8A=;
 b=eI+ODI7XaGRXV9NU5PuN7TCgLhIqHw8njS+/8XtQmd0CZjnbGxC75VGseodq1eRi5FGN/TIf0Eit2GDDZZJXH1KEEoeZApvaimQOJCIUC74ayAMFkpe7GvqefrtsL0jlaDBAzRyIzzGjtLrM3CYfej3PXDpXoXjVtndj3rX8WMc6ZYGgz0ar57fMqrTyEeRuoqgBaWTjWwBbG2W7VRR8u2JPKPD/mJZpSWEIfMZKkZx0VsHcUGdhYQScxr6zpxL4gjn2WSebNLfoDJLZMESRMdUKTAhfVC+/QbVzuuG8wqBSY+VWWZyxd5APjGxoRJX3ppKsL0aXIZxbav/DcKCy7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8912.namprd12.prod.outlook.com (2603:10b6:610:169::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 15:09:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 15:09:55 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 00:09:46 +0900
Message-Id: <DGUXZT9RZEVS.HSSD90Q8XKEU@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 08/10] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-8-dde5ee437c60@nvidia.com>
 <DGS465GNPO0G.1WKMAHMPTXLNN@nvidia.com>
In-Reply-To: <DGS465GNPO0G.1WKMAHMPTXLNN@nvidia.com>
X-ClientProxiedBy: OS0P286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16b::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f44a28-2578-40df-ddda-08de7ac93f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: MKnZ7GZ3GtWd0/D2//862OP3D2q3YK+nnqQIvSEuFeiSQxBFHAd1F+fa4zJHmawAuDsIYlXL1qNwwWfRhRPmnd5c4Wf69dFKhTNK8pulr7rPBLcV23exy0GiKL6t3xEIXo/oEXakGJgBUNMBYPtYNwGkL9PGU3hlJPJvVSpwKmMgDFeHiyoVAHYE9I7Rl7SrlJQobDxOGi2JO1P4yXHZgbp9OTnb2HFztWeUkCsT1mxf04rF4y15d9oWVs1KVOc64SAlnlMEBi3YBZNce5ngWFlwb7pJ2rexKnsvp1G1ZwHKZtlUzLzSKlU646EmUusNWWVxxcYTmSouplcEkELkls/J+TZsu2Gwa4PVK/D+vb2638V+6MuVXoPl4sCFig3mSDi51pAOi5CqviHXt9wZiAz84S+8N4OYOUxSKH3YQbsjScEeQeZB2Ew0mDwmCenKewfPXf255BvYPdVMOC/fgkge2CrGhb4ICj3Y3Efs3at/gktwWdKuxAxJZ97RyEPZZ5G/2msjGik8aOZfWOmNeQznTliZdIMhk2sVrg1awAi60eabGSjTLx7strngJxhLAlhytsHuE853rPu+QWExE9SpVB2MndZ6vejIiIwYbYhKJ7D7DrOk2oc0jfdrMDO9kGHjtSOpR0Dd29mQELcCpaSPjDks8fIBBpZhsn5mx8CyYCGh+SnE+KlltxN3Gl0zP87ubEZNm6VPW5Umsoto/sBUIoP6o+yoryrBG5jTN0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1dlQmF6WnZDM1hCUW1CTnVlMDZ6RnpwQnJkcjdncDRmaFdYUUtXTmQxcTA1?=
 =?utf-8?B?K2ZJRWxVTXozZy91R3YrOERBOFM2MDlxd1lDZ3JzeWRvVTM5RmF1c0pnQ0tM?=
 =?utf-8?B?ZmZHTkVXRnFDLyttRmVLYzdTM2NDTjlsSXorN0lsZklXdmo2VDBMWGdtSU5L?=
 =?utf-8?B?QVcrcXFVQ0VYc042cys2ZkRtNmZDRmNJVnBKY0VwVFZVSnFhUXY4NVFBeW9F?=
 =?utf-8?B?NmhxQ25Fanp0SGpmeUFtaU9Fa3E0bWtzakdRTmg2ZWQ3Z28reURUWVk3TnlP?=
 =?utf-8?B?RmZnaWo1TGpjd0U2RExXbWQrUkdkUGhJYWkrb2pUTWxIekxtYktNdG9VZWNB?=
 =?utf-8?B?Tjh0ZmN3OWRrNGQ2Ylk1alZ4VSs3eUJLa010Y05IOWFWT1FBTjFUQkRXZUww?=
 =?utf-8?B?VDZQMlovcEZEU2hRS0UrZlRXakhzNGhuUjNSM0E0RDRnbUJKbnNHUWRJaEJZ?=
 =?utf-8?B?VDVnSGNqNEZZclVybmViVzJCbXdhNWgvaEpoeWJvUmlhdUhXQXJCUTRIYXp3?=
 =?utf-8?B?S1lsQUNDM3VoZTMrVDFlVUJ5bFVUUDlqUlhLTTA1ZG5lc0NnTks2WHluTUtE?=
 =?utf-8?B?WE1PM0U1eWZlMVgyYTJCRnJKdFBGRTV2NkYxbVgzUGl4Yi84TDNTQ2NESFV4?=
 =?utf-8?B?SU96VFVFaG5VbXlnYTI2U3kwUUZWQzRkd3I0WDQ2K2FyeHhORGZ4LzVQSFlY?=
 =?utf-8?B?ZVFxSEs4MGlrWmhGZEFGYlZIcTJxM1RQU3hOckc0aWRsSU91SEhROUhlcmU0?=
 =?utf-8?B?eStaMVFmYkgzUEVnTjNYZXRDeHJJeUwyK0FlblZmTW5OcnZNOU1GT0EwcVdp?=
 =?utf-8?B?dGMxYzdyM0s3Q2svdW9PbG5uR09Ub0kyc0kxM2VLQXhOb2NMY2w0amQ2S0sy?=
 =?utf-8?B?RWV1di9NS3ZNSFdSVDB3eWkrY202MnlwYlhudkNZeWsxTDZTbEF6amZZend5?=
 =?utf-8?B?cDl0R3dPdC9NSFk5OFc2RVpORTBScW9EelV5eE5vVTB6NDc1ekUrSndkOVlK?=
 =?utf-8?B?UWREMldtcHh1RkswaEt4OWlsUDdONkRZbG1OYldwUjRaQnlDRDRudkhpZnFB?=
 =?utf-8?B?UDhBbDNRQnRyMFZGcUJKYkgyTlFpZWxkaTJaRmJCQ1VvSTlMa3RWOXZvL2ZB?=
 =?utf-8?B?cys4TDN4Y3NsRU82WjU3cm1QYnlwUG9zUTRJYlc0YXYrZUxYa2MrTXJrclNu?=
 =?utf-8?B?QzVnVnhyWFg1cXJRaDVKM2dHUXBtbGdMQUF6MVB2eUE1ak51TG5aYkRXU0kw?=
 =?utf-8?B?N21nL0FUYlJBWE1ranM1aVI1RndKWWhKc21WSEZBVVl6NUUvbExrS1N6UC9Y?=
 =?utf-8?B?dGdzTFNIRUd0ZWdRZVJyTTNua2hIQStmdUdpZUM4SU1KM2xJMW5kaGtsZE1n?=
 =?utf-8?B?N3pDTlhoajBSK2F1L1psb1F6UWFrdGU4eHhvT0pRZjhPQTh0K2FvTVZzMU1i?=
 =?utf-8?B?SHU4ckkzazR3UThaV1JORS9ubk9icjR6SFRLNXM3anB5NmF6WHFkMFBCK1J0?=
 =?utf-8?B?UmdnaDFpMTFsN0Y3cVZFNnBvZHZ5SHZoM08vQis0eGI2TDlhSUtkT1hhZUQr?=
 =?utf-8?B?SDh2dEM1dUlaL0lFTTl6NWtsRjVHejhMNEFKVlR3OXlMWjhadTQ1ZjlaUWFk?=
 =?utf-8?B?SWIwaitvbU5OYmFadHZJc3ExRW5CL0hKQVp6RDlWZjBGR21Uc2JCMTVseG1n?=
 =?utf-8?B?RGpvckp4YTA2UVJzeWIwQTJuWS9ldU5VZThGNGorUXZhTE15NkVSWjVnQkJC?=
 =?utf-8?B?Y1FuM3FEajV0NjN0ZWJRakp1TmNyRml3RHkzUDBLZVJVdE9TdkRDNnJ0WHVH?=
 =?utf-8?B?bGlTYXUzbmZnV1JUVjdWcDJYemNVaVJYbENESG9TdGRXRi9mUTUwZzcrWGZF?=
 =?utf-8?B?WFZvOU9ZMEE3cWNMZ0dDMkJydW1JRENYUTRPMlVSVTBFZ1ZWa3kzSVJYaVpJ?=
 =?utf-8?B?cFVWUk1acEJpR2c1N25yTFlvdWJ6RHBKd2YzeXZ5UHlFTFAzeVFPQmh2Z0FW?=
 =?utf-8?B?RkhNbkd4eU11SHA4OWZNam1zWlF1U0t1MkZIZVpFNE13bS8zNjhVQUwxeGx2?=
 =?utf-8?B?NEkyR2lSZkVOSjBhZCsxTjAwUG9sSUFtUThpcmhlK0tZM0laMzN0MkdXTnR4?=
 =?utf-8?B?ZnBwMEJIQThodzVSNi9RZU1mT3hnK3ZDaTFKZGtXQXBoV3JjU2N4LzNjS2I5?=
 =?utf-8?B?Rkw1dHdBc2tlZzV2QU9saGJ6c2w5R3dHZnBlMFBpeGIybVVBbFo3Y2dRTDNo?=
 =?utf-8?B?dngrNENwa2dvbHUraUp0VGFZQWthVGlVd1lTZGdGZ1Jkb0orRGk4Zi92azRl?=
 =?utf-8?B?UWoxNUdDbVYwYWd6VnVBUHFhZEswQWlmLzlRVU9PSzdENENNd0IvYkV6K3U2?=
 =?utf-8?Q?Cuxk8nBpgNwVbzqsZrbGcbmmSjvIsgSFZKjJWxilpgN7O?=
X-MS-Exchange-AntiSpam-MessageData-1: 3EmsGetpZZ5Axw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f44a28-2578-40df-ddda-08de7ac93f80
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:09:55.0754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cmc7IzIoHPHSktMZspTiwmu1lujseqkop7z1l7DYhWCaukZkwOwvaDrhvy/bxvHMONxlu3i1vnjwJRf+7hg3Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8912
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: AA056214368
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 4:22 PM JST, Eliot Courtney wrote:
> On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
>> From: Timur Tabi <ttabi@nvidia.com>
>> +impl FwsecFirmwareWithBl {
>> +    /// Loads the bootloader firmware for `dev` and `chipset`, and wrap=
 `firmware` so it can be
>> +    /// loaded using it.
>> +    pub(crate) fn new(
>> +        firmware: FwsecFirmware,
>> +        dev: &Device<device::Bound>,
>> +        chipset: Chipset,
>> +    ) -> Result<Self> {
>> +        let fw =3D request_firmware(dev, chipset, "gen_bootloader", FIR=
MWARE_VERSION)?;
>> +        let hdr =3D fw
>> +            .data()
>> +            .get(0..size_of::<BinHdr>())
>> +            .and_then(BinHdr::from_bytes_copy)
>> +            .ok_or(EINVAL)?;
>> +
>> +        let desc =3D {
>> +            let desc_offset =3D usize::from_safe_cast(hdr.header_offset=
);
>> +
>> +            fw.data()
>> +                .get(desc_offset..)
>> +                .and_then(BootloaderDesc::from_bytes_copy_prefix)
>> +                .ok_or(EINVAL)?
>> +                .0
>> +        };
>> +
>> +        let ucode =3D {
>> +            let ucode_start =3D usize::from_safe_cast(hdr.data_offset);
>> +            let code_size =3D usize::from_safe_cast(desc.code_size);
>> +            // Align to falcon block size (256 bytes).
>> +            let aligned_code_size =3D code_size
>> +                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMEN=
T }>())
>> +                .ok_or(EINVAL)?;
>> +
>> +            let mut ucode =3D KVec::with_capacity(aligned_code_size, GF=
P_KERNEL)?;
>> +            ucode.extend_from_slice(
>> +                fw.data()
>> +                    .get(ucode_start..ucode_start + code_size)
>> +                    .ok_or(EINVAL)?,
>> +                GFP_KERNEL,
>> +            )?;
>> +            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
>> +
>> +            ucode
>> +        };
>> +
>> +        let firmware_dma =3D DmaObject::from_data(dev, &firmware.ucode.=
0)?;
>> +
>> +        let dmem_desc =3D {
>> +            let imem_sec =3D FalconDmaLoadable::imem_sec_load_params(&f=
irmware);
>> +            let imem_ns =3D FalconDmaLoadable::imem_ns_load_params(&fir=
mware).ok_or(EINVAL)?;
>> +            let dmem =3D FalconDmaLoadable::dmem_load_params(&firmware)=
;
>> +
>> +            BootloaderDmemDescV2 {
>> +                reserved: [0; 4],
>> +                signature: [0; 4],
>> +                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
>> +                code_dma_base: firmware_dma.dma_handle(),
>> +                non_sec_code_off: imem_ns.dst_start,
>> +                non_sec_code_size: imem_ns.len,
>> +                sec_code_off: imem_sec.dst_start,
>
> Is it correct here to use `dst_start` for `non_sec_code_off` and `sec_cod=
e_off`?
> AFAICT, these are meant to be offsets from the base of the DMA memory and
> it's meant to copy into the falcon. But the documentation on `dst_start`
> says `Offset from the start of the destination memory to copy into.`

OpenRM does the following:

    pUcode->imemNsPa =3D pDescV2->IMEMPhysBase;
    ...
    blDmemDesc.nonSecureCodeOff =3D pUcode->imemNsPa;

and

    pUcode->imemSecPa =3D pDescV2->IMEMSecBase - pDescV2->IMEMVirtBase + pD=
escV2->IMEMPhysBase;
    ...
    blDmemDesc.secureCodeOff =3D pUcode->imemSecPa;

So it *does* set IMEM addresses (i.e. destination) into these fields as
well. And their documentation is the same as Nova, which is all the more
intriguing.

But the reason for this became clear after I figured out that the FWSEC
firmware was a *mirror* image of what is expected in IMEM. The IMEM
destination offsets are also the offsets from the start of the source
DMA object, hence their use in `BootloaderDmemDescV2` - for the
bootloader, they are the offsets from both the source AND the
destination!

I've found a couple of differences while reviewing the code though.
Nova-core did not do the `- pDescV2->IMEMVirtBase +
pDescV2->IMEMPhysBase` part, and it did not pad the FWSEC start image
with zeroes up to `IMEMPhysBase` like OpenRM does (to have this
source/destination symmetry). This happened to work because these values
are all zero in practice, but we want to align the code to do the
correct thing otherwise we have a theoretical risk of mismatch.

>
> Also `ucode_start` is defined as `hdr.data_offset`
> but doesn't add `code_off` from `BootloaderDesc` and `code_off` appears
> unused. So does `data_off` and `dmem_load_off` for that matter.
> I find it hard to follow what's actually required but it seems odd that
> none of these are used.
>
> At least for `code_off` should it not be part of the computation of `ucod=
e_start`?
> `let ucode_start =3D usize::from_safe_cast(hdr.data_offset);`

These two appear to be correct, at least if we follow OpenRM. For IMEM:

    // Copy bootloader to top of IMEM
    virtAddr =3D pBlUcDesc->blStartTag << 8;
    NV_ASSERT_OK_OR_RETURN(
        s_imemCopyTo_TU102(pGpu, pKernelFlcn,
                           imemDstBlk << FALCON_IMEM_BLKSIZE2,
                           pBlImg, // <-- start of image, no `code_off`.
                           blSize,
                           NV_FALSE,
                           virtAddr));

The `BootloaderDesc` is only used for `code_size` and `start_tag`. And
it's not strange considering that it just contains the code to load into
IMEM - the data being the `BootloaderDmemDescV2` that we construct from
the actual firmware. Since there is only one segment in that binary, it
makes sense that it starts at offset zero.

And here is what OpenRM does for DMEM:

    // Copy dmem desc to DMEM offset 0
    NV_ASSERT_OK_OR_RETURN(
        s_dmemCopyTo_TU102(pGpu, pKernelFlcn,
                           0,
                           (NvU8 *) &blDmemDesc,
                           sizeof(RM_FLCN_BL_DMEM_DESC)));

Here too it makes sense that we load at offset 0, since there is only
one data segment (the `BootloaderDmemDescV2`) that we build ourselves.
There is no other data to place anywhere.

I suspect `BootloaderDesc` (or `RM_FLCN_BL_IMG_HEADER` in OpenRM) was
recycled from some older (pre-OpenRM), more complex firmware and
inherited its documentation only serves a limited purpose here.

The comments on `BootloaderDesc` are incorrect for us though. I'll amend
them.

>
> Overall I find the dst/srcs here confusing cos it feels hard to keep
> track of which set of memory things are in. So, sorry if these comments
> are nonsense.

The documentation clearly sends us on the wrong path, so good thing we
fixed it.
