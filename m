Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK0XFJJdqWkL6AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:40:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38320FD27
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EC710E033;
	Thu,  5 Mar 2026 10:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kaJVNIbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012063.outbound.protection.outlook.com
 [40.93.195.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A3710E033;
 Thu,  5 Mar 2026 10:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6JPklFevxlQidfdcKm/JCBFJNDW4mKV9kEhjGLnnMs6Rig1BxQxWMjsHE61yQN0phwLjdLs/da5PTVZk9nLwFKyuz+9g72mQ6FG9OORc/WHS8bEZt6xfjWkpi7wLugNTn/6xz7pH5nX19/VHvs0KT+xFakNY9OeImxB0g3e/L1CLAn7Iz/PQ8gbqoYMC8aBVfPpGruuAh0MwFWKidhSnjvHLz1IDtZHfhwkWCl2MtBrbS4QUqfBSRW8KoZZMYjA7UmY/Nw3dFG4jv4dx45Ap3R5Oxx1sP+B7B1CADnieboOppDXBhht+ofphX8UpFGdRCtHLeXr0WAqvYqaY7lFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+Qtgaj6Hmp2BXVE/QSMbMe/5HJ2WemQ3+FN1yhTstE=;
 b=wZkSY4UDwhM7s49H8vAEMucJ3t5wG+nxqGKgzFIpSacQGBt6FpkGku97eaYgJJkzRvFLTj1DVR7wnTsorzmsBFqbHejskSnelsx9DBphLfvZbNqQjouTx+v5rLfoLX47gU0I2gPgAzw/1LuAmrMgiqNGF6X3FLW2BY9xGHQlUgkcrRQuIxWTy/M60Hfw3WgkQD+VOAnIu95LmdqJ5VHIE9uaga6RQ9SxOOHSmlEUEtr/uRP+0vznAneH03eEwcV/MVy//vOzLYA6h31MigiUHY0E+03OkQZN3kRICwjZd7i0+jyrRluIYd0VkFTkHBq5HeK7SC7TW1WEB0cyPmRU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+Qtgaj6Hmp2BXVE/QSMbMe/5HJ2WemQ3+FN1yhTstE=;
 b=kaJVNIbXU9qmY8IofCqwTcmR6mpFD2emndC/e+5BfmcBDBYkdcL6KS7wmQuyWhig+bBsoJG27x0k0eYl1zEdbzp8nwpWsmPcMyWA5Rr+eaop7HTNwM1EPIL5KEWkrP3DvP87LuCSxct/Y0MGOiOo2azuZd2rQU07ob/Pn2aE9jEdbLuBCSohFazoWakKYSkbQgWNTO70ZML2mmlMdoUvfAZcPsBSMeRjjnsL2pRuQ82Wkz2NJSJ2aQDxGYhU8ao5Xevy9QiMEmaukKUWt+yGBN72qLmyfU1VNQh/6H7ig0RIgZ1RyAOsz7x9bO8mzCFLwIwWE9ApJMMIsNX46UfJnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:40:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 10:40:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 19:40:07 +0900
Message-Id: <DGUS9CQH9WJ3.GVZJ7XOEMHL0@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
 <DGTZ9NLS9TPM.2NRF5C9VN2B7C@nvidia.com>
 <DGUGNCEXKDD2.ETWE4H89AL00@nvidia.com>
 <DGUHEUO4O47L.GD24M2B30IKY@nvidia.com>
 <DGUOJ681GZND.2JV7DA2YA5Z8E@nvidia.com>
In-Reply-To: <DGUOJ681GZND.2JV7DA2YA5Z8E@nvidia.com>
X-ClientProxiedBy: TY4P301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d320410-2fbe-4166-5efc-08de7aa393b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: 015imOL27uIsXVBgI8OPoKd2b/TvizpmRD1C6t566yp6v0hLdiMIv2XFUYBjvDPSYfFy4g6QUex0ss29pxAZeKv6dkMoFa61VDP2Mn68CHCsN38mZnjyKyf3cVmTR1j6IaDLp/xeGBohdXYXrwMyC78HyB8GfTxRtLhXtqjOGfadrtTFSRyGH7YqH9jgYfQWWKnAjYf1IgtQkkGITE1bbOV7cBWqSAQJqtDN8fPXNTEP3lti297k+8/MRFENnLAkX6yB0NrGkYNmFH8cqvmng9v//3eyTC9sZcxO4FtFJGfPij8anOEtCeV/2kEkFQSRsbEPENAGhqaeLUUuT39ajUrrGTGiy5qPE/RsjV8HaH2Bzt9m7b/6Ve3fFRhctn8HdrAHNDrxnbmD1G6pJYinWTiAMyrqNtrY4/fTNzm7dnGa5/Cx65bTSC24bcHlHHbYqZyUPgeoxRUBz+BfHJkmhcpvhFh1GqE+4g0Ibyrsojc9SinYMs013pBVc4C6MIrDj7EPqPPqvh27rJUELm0fhCsfTJBXf3Z42OVo/wyRojW59Jylno4lgA0LcIsBuPCZKat8F9vG+SabqlYmkpmh1XJA0qSYc343UpmlKKNmVnQ12AYFdTr+cainiXBml8TN+9SL6zzHtpqtwZf+cWQyNOSl481TcgTnAcTnrKLi6UOaoXaRCucVXiZ62H0w0AgZkOiZZYSep9SkLXOMb9NWUxe6XVzMxwdLPszbnZVHgn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXRZcW9oNzlDYVl2NTV1Q0VZSkpFRkFGRnRhNVgwN3VqMjVBaE1zbGlHbjhm?=
 =?utf-8?B?TXBaYWZXUHVCTEMxWHBIY2hNRTkxelI1bVhCSXk3VGt0T3JGQjhUSXZOOStK?=
 =?utf-8?B?M0xDQm1jNzBaVUtTQTZTRmljdUpjT01IYzMyc2lBS0gvcTcyMXl5Q3lOWFM1?=
 =?utf-8?B?RlVpc3pab3FFSFU2cXQ0dm1pZWZrRlJjS2JQdnNhai9oUHByVXorSkVBSnBp?=
 =?utf-8?B?anhRUHlMREk4RTMrNVMrVHo1bVN0M1k5SzdvbUJkbzAzZ0FkOGkyeDVCM0lN?=
 =?utf-8?B?RERwQUg5THpZNjNjT1NkQk9BblNBUWt6UXd6ekJIUjFOTlEwekUrdGdyV01y?=
 =?utf-8?B?OW9Fb2ExSzg0cm9tQUx3WmVrd0k1b29PTVZRM05kVzB3R01Makw2di9qdENQ?=
 =?utf-8?B?WDUvUXcvVzNLWnJ2YTQwTzZpMlcxRldNZ2l3MCtQaGo0RS8wZ0h2VkY4RW4w?=
 =?utf-8?B?WEpoK1BOYll0amxndStRR2hWWHlkcUZTb3VGTHlhTUgvY2xCdk82aTA4K1l3?=
 =?utf-8?B?RERpZXl6SW01bU5iMENIWEs5bVlGcVRKN2NicjJsWWpIaytYeGRBdVZFQWxh?=
 =?utf-8?B?a3QveGhveXZ5dnFZUUhVRHpJaHdqZ3BFbTl6YUM1VDFnU2hjUVFPRXZ5TE1F?=
 =?utf-8?B?NGZtS2RZZURqaExGVjBiZWoxOGhxYjlJOEhuUmNORm5LVTNMVVhTR1puWjJa?=
 =?utf-8?B?ei8vQ0ordTQxdElZU3pkZ210dnVaQnYxa3hQelhrQlUwZEJTaTduWGRqVGdm?=
 =?utf-8?B?QXJ1R3BnK0RsMWVsNDRNU08ycGRyWGdQckdJSlpDR0UyeWpoZURRNU4rYklQ?=
 =?utf-8?B?QkNqNHphWktEVGR0NFF6UWp6SVFhWlhTWHd3NDhrQVRRRkJwSXlubzFuWG84?=
 =?utf-8?B?RDRNQ3dSMDcyMFJkMnNJTFR4cE9nU1NpbHp4MFE4bDZTUjE4T043cEZzYjFU?=
 =?utf-8?B?ekNFaW9SQUpOOGQ5WWpCdTVITVJ4MUs4TDVrUm85YUQrNU5nemZ6d2hYS0Ev?=
 =?utf-8?B?Y0VmVmczc2pMRmFQNW16cy9OUmZaRDljRjlZVmIrQm1lcDg3WUh0M0Q5ZGJk?=
 =?utf-8?B?YkVTdk9rd3dxdzR1NjU1eExaUXEyUWdsR0VrRTFIZDFvTDA3VnFDV29NN1RK?=
 =?utf-8?B?NWtnemtobndJMkJpcmQyT1NyZitFQllkM3R4ODcxQUFEQkxNa0hHaGlMbzlY?=
 =?utf-8?B?V2hLVXY3ZFhscThpMUIzeFQ4OE5aMnZvTE5LN1QxYXYxNDErbVVkNkhuTFIr?=
 =?utf-8?B?MGh6MTF0K0hzdHV0NnJxSDJQdzZMUGRmMVpoUncxOWJIc1NTam5wa0xHMEl4?=
 =?utf-8?B?dDdpQ1NPd0dRRm50bkNsbGJtVG9XMU54NkRadmloNFRNckFRYmNvSVJhSjRJ?=
 =?utf-8?B?L1dsV0hOU0VmYXNTTkt4UWxETHdhVjJzK256cUcyMHVUVEJ5dmZKc0dZWG5k?=
 =?utf-8?B?UUdIQktobnlveHRlVmNrUzlueVhsSVh2cC8rOE1EVjRENk9ySUNJZ0xGWU0y?=
 =?utf-8?B?c2VheDVaZlIxeUgzTEtrYWc3U3JjckVhd1IzNVZFVy90NG5XN25hMk1GeSt5?=
 =?utf-8?B?aHN0cWpPa1BNRUlRVWxOM0xZZC9odUk3d1RobCtuSm9RWElvU3hselNwNGVH?=
 =?utf-8?B?cEM3VkcxWU8vOTNqOWlaVHdiOXB0dVpsOGZ0NDdjbXpRaU14NVYwVVN2ZGxq?=
 =?utf-8?B?U1RNRm9PYUxMd3c2L0ZTdFhqY0JmZ21aNERRM3c4eTQrS2x1VStOdG1rMWNF?=
 =?utf-8?B?UktQT0pod053M05IREdYeWhDZHZidFFEbEVFQ1lKVWhVWjUrY1hHUXoxZ0No?=
 =?utf-8?B?MXg5a2gxODdkcEF3d0ZjWEQvaThSemdyK2pQMGpEVzExd1hmL3g0WjduWUFC?=
 =?utf-8?B?Y2pmelg4WnB5VFJXT3NFTHRiQVdsaUVRS2NkalErTlFEQkV3alZkT3EvVDZ4?=
 =?utf-8?B?emV0VkVsRXJMMnVxbWx4aWFmejM2ZDRPM25oc2VHS25UMGFrakdDd2d3UWFM?=
 =?utf-8?B?WUdrWlRQeVlwWjI2eGZsZDdZN2tpZ1RLZjJrMVQ4MU8rRzk1YWQ3MklWTnV5?=
 =?utf-8?B?cWVPTkxCelM1UXZwU1Nqa24rUXM2emI1VUkyNlNRN05uQW50R1hId1NSZm5o?=
 =?utf-8?B?cjZqWnFOQXFOb2RjVDgrU2ZTcjh1V2gyM0dJMVZ4TGpVQ2JMTHIwdDhzUXl2?=
 =?utf-8?B?MmV2SE9sYzR2cm14dWZsTEFZblNpMFJ3TklXYjRhQmI0aGtFTU4vb0l0WG9v?=
 =?utf-8?B?U2JmcXE3TldmU3Z6ZVNXU3VmOXV5VlY2M1JuZkxKZXg2YTArQlM4a2oyOHk1?=
 =?utf-8?B?THN6RnFXblhQaGdmTzJ1S2NDR2pmNDNwcDJLN0cyODl1SHc2cjBUc0tXUThU?=
 =?utf-8?Q?2Dwihnw+TRcFOfKhAk+01GnopQVbHzM+n9ioYSgDnQNYd?=
X-MS-Exchange-AntiSpam-MessageData-1: aSgwDyun2ucfzw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d320410-2fbe-4166-5efc-08de7aa393b2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:40:11.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+P/z8UXej+9kMB9oefDFvwLHorNT5/L3YkcjqcViXab0hyl24L4kdcgiS6xP6Ss94ZG/1NxFjdPBMgiTTgd0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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
X-Rspamd-Queue-Id: AF38320FD27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu Mar 5, 2026 at 4:44 PM JST, Eliot Courtney wrote:
> On Thu Mar 5, 2026 at 11:10 AM JST, Alexandre Courbot wrote:
>> On Thu Mar 5, 2026 at 10:34 AM JST, Eliot Courtney wrote:
>>> On Wed Mar 4, 2026 at 8:56 PM JST, Alexandre Courbot wrote:
>>>>> +    /// Sends `command` to the GSP and waits for the reply.
>>>>> +    ///
>>>>> +    /// # Errors
>>>>> +    ///
>>>>> +    /// - `ETIMEDOUT` if space does not become available to send the=
 command, or if the reply is
>>>>> +    ///   not received within the timeout.
>>>>> +    /// - `EIO` if the variable payload requested by the command has=
 not been entirely
>>>>> +    ///   written to by its [`CommandToGsp::init_variable_payload`] =
method.
>>>>> +    ///
>>>>> +    /// Error codes returned by the command and reply initializers a=
re propagated as-is.
>>>>> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M)=
 -> Result<M::Reply>
>>>>> +    where
>>>>> +        M: CommandToGsp,
>>>>> +        M::Reply: MessageFromGsp,
>>>>> +        Error: From<M::InitError>,
>>>>> +        Error: From<<M::Reply as MessageFromGsp>::InitError>,
>>>>> +    {
>>>>> +        self.send_command_internal(bar, command)?;
>>>>> +
>>>>> +        loop {
>>>>> +            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT=
) {
>>>>> +                Ok(reply) =3D> break Ok(reply),
>>>>> +                Err(ERANGE) =3D> continue,
>>>>> +                Err(e) =3D> break Err(e),
>>>>> +            }
>>>>> +        }
>>>>
>>>> There is an opportunity for factorize some more code here.
>>>>
>>>> Notice how the other callers of `receive_msg` (`wait_gsp_init_done` an=
d
>>>> `GspSequencer::run`) both use the same kind of loop, down to the same
>>>> error handling. We could move that loop logic here and do it in a sing=
le
>>>> place.
>>>>
>>>> In the future, we will probably want to add handlers for
>>>> unexpected messages from the GSP and it will be easier if we receive a=
ll
>>>> messages from a single place.
>>>>
>>>> This can be a separate patch from this one, but I think it makes sense
>>>> to have that in this series.
>>>>
>>>> I expect the last patch to change a bit as a consequence of that - may=
be
>>>> we will need a `receive_msg_loop` or something in `CmdqInner`.
>>>
>>> I agree we should migrate all callers and make Cmdq responsible for
>>> draining / handling spontaneous messages from the GSP, but I was
>>> planning on doing it in a separate patch series until now. I can put it
>>> into this one though if you want though no worries.
>>
>> If it ends up being convulated, let's do that afterwards but since it
>> looks like a quick and easy win I thought it would make sense to have it
>> here. Your call though.
>
> Another consideration is that if the GSP has some issue, it could cause
> this receive loop to run forever. I'm not sure if that practically can
> happen or if we want to guard against it, but personally I think we
> should and taking care of:
>
> 1. Some loop level timeout
> 2. Future considerations for how to handle spontaneous messages /
>    draining
> 3. Migrating the callers
>
> Seems large enough to do as a follow up series to me. But LMK if you
> feel otherwise. Thanks!

Follow-up is fine, especially if the fix ends up being a bit more
involved than I first expected.
