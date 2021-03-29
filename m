Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD334D11B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2B26E3FC;
	Mon, 29 Mar 2021 13:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2936E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 13:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzqoqRLa5LkFcUV6uv3fGlS+/foSAGw3G8aEB0pRQ4ACZrMGuEQ9FC1eIZvAbgEA4A/pi6ro4vOTzO2KXroWzrRaICiKc2WErHLYLfIJjFSV+g0zJm2iezZ1kPoQggUoY0UkQQYjfky8ArFVEr1KV6Pdhxdl1smc1f8wTfrSfAwOjT9Y6d2VCTDnK2uSueGl8zbP+YwmGN4ZxW50WDSBROjltnHP7LVTWEyy/AH2PsZeanRFsTF/2B2P5CB4s1zSnHSxX2AhfAKX6y3lXIw3/+q0m/zYH55YWDLNQMaLZf09u8jPU8goEjI97eOGfWhLX9DWkFfsa0KQ7ftNqI9wfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=729qrDSQ9IEErNxVk5ewoli8SlnFr5eZUF7zON8xjyI=;
 b=ofQV84pIc+qhc0CZCbkSOjKneEFQQjayLaoRxUGjrX7g7/2KiWQyWWj6xwOidxP1S9Jg9UOnReTA4xwcvRWC7HgJ7luXEhsvfKxvIzhvMIBjRS3hFkoXsAGmynHgGG35nV1gOvozbVzAzY7I09orC/RjbUMS6TmoK2myTDreuuFUQ4/9ol3R2FQIaqcUwjOFfM8C5l3AzstBy/ejXBE5Zr2QBJ8n01TPFb6PtY8repzG5TlaepobJHioJr/a3rFR2/SH1AOdHReSnammXtz7+IoZ/QB7SW14Mxg1T+Br75rXMJ0V3uKj54G+EtHw8dcUDekwrLM0fC1Av8SQ/UsqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=729qrDSQ9IEErNxVk5ewoli8SlnFr5eZUF7zON8xjyI=;
 b=VSc0h2Bfbz5jCVrPyZLZWwgyg3dDFYA6J0AlLm/CzXLkr4zD1ZT+Rt1/V0SbCziRhSyBmmZqdtC6TSL6tD0EvtuM7rlNPIri/t/1VHEy19vcjvaXFkzuUIFeQC2GA5FSgJ5Ax2BUxXCYT0VibhvOIfMIFzayc1pJgzT/pD257xyVW+UIoqVYI+AdVQRofe/aUVicXifHoAivnVynduBsUJL6CIxwP878pz5zoBc+7kpTo0XlWssDNDDYBj2eoIdwgSOUpmiAtDHwysKoxWjCVl13ocHfc+I6El88nSmon9n+PUdHnhi9jWF+WuwFNjMDoEW3VthhFMNgeh30rHBJSA==
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3514.namprd12.prod.outlook.com (2603:10b6:5:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 13:29:42 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 13:29:42 +0000
Date: Mon, 29 Mar 2021 10:29:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/3] mm: Add unsafe_follow_pfn
Message-ID: <20210329132939.GA1168773@nvidia.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-2-daniel.vetter@ffwll.ch>
Content-Disposition: inline
In-Reply-To: <20210316153303.3216674-2-daniel.vetter@ffwll.ch>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL1PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::26) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0081.namprd13.prod.outlook.com (2603:10b6:208:2b8::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Mon, 29 Mar 2021 13:29:41 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lQrxb-004u4f-U4; Mon, 29 Mar 2021 10:29:39 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e84875c-1522-4706-6b60-08d8f2b6b578
X-MS-TrafficTypeDiagnostic: DM6PR12MB3514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3514105C66A9516B629D6A24C27E9@DM6PR12MB3514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6I89oTpVCFgoeCQdG6nQu7k8Y1TitSzTwFzUD03mWssD5Vd0/AnQRPp4vtZjT3cPuEyPNMD0bB93FtpiGRkbrR6ViqYmNMnXNGxCJBqilZtTUT6z/QFOmjGs3vogFqlSIqmkbclKhZS2LL3wqoBpOk1G20szal4illaTkD25JOerAxRz6TERce3EmaBvYwHpvDeZMwNqe+ZaKoZGhknbPg80Up7VZdyliIBrFBn1QT3G9mGizOO7dBSsKmqozfto9AbU2stzubo0LIn97mZ7xMXkJRKca/Nzo+vRVGUXun01cMmc/IJT5Mwq61MlnWQxyMb1VmAU85//khozhti6Ww/M9NkYiBUXl/9+eqqpkgxuC/38MNTzZlT3aL48BhLXLnzlNP+iSf4EviPWj8sEu1GLuF5zEqZAP/5RHcOnFToSvXUp++ytimUY8FDLmm+LSh0YU7/nVlGyJvE1VAvDwx8zWTlh36TUF0ggikJAwStWS1bnLYypOVQom3K2eFT/K/EOEkb1CyRZ6UXagS6dUjt+X4S8II4J2GOhJ7ofvyKdPXSjyH0lCpUNkO1kjANtEf7gywnVTSPRwr7mPzJTjQRT1axci/yB6O0GdV2DstFLq2VRutLx3aBIALMGM1LSMjljvcDKFxfLicG6NwX4ciYR+nEEFwtdggufB1i5zK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(4326008)(33656002)(7416002)(54906003)(2906002)(38100700001)(26005)(478600001)(6916009)(36756003)(83380400001)(8676002)(66574015)(316002)(8936002)(9786002)(9746002)(5660300002)(86362001)(66556008)(66476007)(2616005)(186003)(426003)(1076003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZnlFc3lNQTVPUEdlbFBnZ1N1Vzg4dmMwM2o3TUwvOVcvaEh3Tml3ek1HSlFR?=
 =?utf-8?B?dDBSQzJKS3lxaVgydHVIRzJkaUd1T011QzlLYjlmaUhoVStCTTg4aHM0bmtO?=
 =?utf-8?B?L0FWTlZoN0NsOU1INDByZlEvQk0vcyt5Z2ZhTmFpNWRtUFJtMDY5QzgweWtX?=
 =?utf-8?B?UUNua0luODIrT29kVVN5cEVpRFg4SzdGNVZHekp1VytVRTZraVlZM1pxd3FD?=
 =?utf-8?B?ZDNaeThDdzY4M1RYcmJROFhuNWZmc2YySlJ0c1ZEME13TXJSOGF2UVVqTTNG?=
 =?utf-8?B?K1M5c1B0bmtTTThodmM0Sm0rRDVKTXJUQWlwTUlLeWQ3MFF2VStxeFl2S3FR?=
 =?utf-8?B?MnYxR2xDUXl2UFdJT0Z2aVFzSE1xNE54S1Y4aFBIUU10SHk4dkJyTzI4aGND?=
 =?utf-8?B?eUt1R0h5QnhlcE9HbUM3SDloWVdqMHZyakwyZC9YZnpqTDVuaFMrQU84YU1J?=
 =?utf-8?B?UnYvTFdjZ0NKejMzSHpSUmNIRk4wTjB4NEk4VDdLcEE3L2I0VHQ5ZmpXTFJQ?=
 =?utf-8?B?ZFlldGI3dDJlMWdCM2FOZzcvWm80VkduYjZvbVhDUW9DbFBiaFN4MU9Rdld4?=
 =?utf-8?B?RHhmbHJCLzVQdlU2akRYQS9FSkpEVDdsMVc5SXpRMWpUUm9pcjl0SDFNR3Bp?=
 =?utf-8?B?TWxld3EwbnIyTjhkZ3hBSXRteDBxRlFiSVRwVllnUngxczFHcEVta0g3NHF2?=
 =?utf-8?B?Y0I5aFFid28wOHI3RWRTUnNCVWxtdCt6aWpQVHdWSTV6WkNBS0lNT1l0SlRY?=
 =?utf-8?B?YjVQU25XSjJIamwveS9EQmFZWUN0eG0rbFVDa0dCb0tPUmhHdnZNNFNROEU5?=
 =?utf-8?B?VStqejRMVkhIVzVkSkdtcmFhN2pTMHg1UGRXa1dUTmxhekFiOE5QQ3lpSnN1?=
 =?utf-8?B?NWZNQXliNGU5SzdoUWt1MXlXY0xIb2tkMndaT2dxS0lOUVU2eC90NXhIMzBI?=
 =?utf-8?B?aDdnNDFqd0haeWR2YUkyeHdNWm1GeWJmU2FyK2NsMEoxYVZDSXhvaUdlUGo2?=
 =?utf-8?B?T3N3ZnBaY1RhdWpmRlRUVzB6di9Gck5Uci9LOFZJQ1lpQ2s1TFVVR2EyTmFK?=
 =?utf-8?B?NkNoOThZMm44U2RQdUd2NGl5bnFabitmdHhVTkR2OERTTFBEeDhEZk5GNW5D?=
 =?utf-8?B?K044Z01rSUY0Sk91T3YwMitBQm5tYVlmbEs3SFRCUEpKVldTTlhtWTd0bHVB?=
 =?utf-8?B?a3dxUndmZkpkNmZkK3pWZ3hhY1c1em9keU5WU0V6azBsZ0x2a3I4ektWM1F4?=
 =?utf-8?B?YmEwVkU0VExydEplV0dyOExjNVBwWkJnRU10YzZoZ3RTMm0ydE5nSHVMaGw4?=
 =?utf-8?B?eEtIR1lBd1VKRmVSVDVaVWR3Y3AyR01ENFk1R3RwR1FhUTVlMGVTZUF3Zzcw?=
 =?utf-8?B?WDhBTEpKUFZ3SEdramhVM2tYaVBselB2L2FubTRybVpIQS9tK050Q3h6My9K?=
 =?utf-8?B?YktaOVJDUkJBVi9YdklXVTRHQnRnbTZYS3lmNUhHQzRaSFAyNXp1T0t3Y1NC?=
 =?utf-8?B?Y0IzUUo5TlJiSU0vNXBTL29rRGZjTGRlTHVVTlJmcXFiNFdYbzlweHdrb3Y3?=
 =?utf-8?B?VDVXYkdaeDQ2cE45TzN4bkVNVkg2MTZjbEdwdDlKUGpqc1llMldoWmo4bG9m?=
 =?utf-8?B?ODMzZ1pCWnVlQTdqUS9FYVo5eE05QVBxZVIvaUFSZU0za0ZHajlabjlhUzc2?=
 =?utf-8?B?aWhLN1NkVU5yajZaY0t5TWMyalNKbktRVGY0dVJNOUlIaCtzaDRlbkdSblNw?=
 =?utf-8?Q?UQXiITZZYz6tU8FZl4AlgxGueCpz3WtS/HUHmoS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e84875c-1522-4706-6b60-08d8f2b6b578
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 13:29:42.0809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsG1ZgaZN4VriPnotgDifhDjwtODr+Sv2l3nKXn58smn2UpLfJ5mjA5PAodrSIko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3514
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTYsIDIwMjEgYXQgMDQ6MzM6MDFQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXYXkgYmFjayBpdCB3YXMgYSByZWFzb25hYmxlIGFzc3VtcHRpb25zIHRoYXQgaW9t
ZW0gbWFwcGluZ3MgbmV2ZXIKPiBjaGFuZ2UgdGhlIHBmbiByYW5nZSB0aGV5IHBvaW50IGF0LiBC
dXQgdGhpcyBoYXMgY2hhbmdlZDoKPiAKPiAtIGdwdSBkcml2ZXJzIGR5bmFtaWNhbGx5IG1hbmFn
ZSB0aGVpciBtZW1vcnkgbm93YWRheXMsIGludmFsaWRhdGluZwo+IHB0ZXMgd2l0aCB1bm1hcF9t
YXBwaW5nX3JhbmdlIHdoZW4gYnVmZmVycyBnZXQgbW92ZWQKPiAKPiAtIGNvbnRpZ3VvdXMgZG1h
IGFsbG9jYXRpb25zIGhhdmUgbW92ZWQgZnJvbSBkZWRpY2F0ZWQgY2FydmV0b3V0cyB0bwo+IGNt
YSByZWdpb25zLiBUaGlzIG1lYW5zIGlmIHdlIG1pc3MgdGhlIHVubWFwIHRoZSBwZm4gbWlnaHQg
Y29udGFpbgo+IHBhZ2VjYWNoZSBvciBhbm9uIG1lbW9yeSAod2VsbCBhbnl0aGluZyBhbGxvY2F0
ZWQgd2l0aCBHRlBfTU9WRUFCTEUpCj4gCj4gLSBldmVuIC9kZXYvbWVtIG5vdyBpbnZhbGlkYXRl
cyBtYXBwaW5ncyB3aGVuIHRoZSBrZXJuZWwgcmVxdWVzdHMgdGhhdAo+IGlvbWVtIHJlZ2lvbiB3
aGVuIENPTkZJR19JT19TVFJJQ1RfREVWTUVNIGlzIHNldCwgc2VlIDMyMzRhYzY2NGE4Nwo+ICgi
L2Rldi9tZW06IFJldm9rZSBtYXBwaW5ncyB3aGVuIGEgZHJpdmVyIGNsYWltcyB0aGUgcmVnaW9u
IikKPiAKPiBBY2Nlc3NpbmcgcGZucyBvYnRhaW5lZCBmcm9tIHB0ZXMgd2l0aG91dCBob2xkaW5n
IGFsbCB0aGUgbG9ja3MgaXMKPiB0aGVyZWZvcmUgbm8gbG9uZ2VyIGEgZ29vZCBpZGVhLgo+IAo+
IFVuZm9ydHVuYXRlbHkgdGhlcmUncyBzb21lIHVzZXJzIHdoZXJlIHRoaXMgaXMgbm90IGZpeGFi
bGUgKGxpa2UgdjRsCj4gdXNlcnB0ciBvZiBpb21lbSBtYXBwaW5ncykgb3IgaW52b2x2ZXMgYSBw
aWxlIG9mIHdvcmsgKHZmaW8gdHlwZTEKPiBpb21tdSkuIEZvciBub3cgYW5ub3RhdGUgdGhlc2Ug
YXMgdW5zYWZlIGFuZCBzcGxhdCBhcHByb3ByaWF0ZWx5Lgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBh
biB1bnNhZmVfZm9sbG93X3Bmbiwgd2hpY2ggbGF0ZXIgcGF0Y2hlcyB3aWxsIHRoZW4KPiByb2xs
IG91dCB0byBhbGwgYXBwcm9wcmlhdGUgcGxhY2VzLgo+IAo+IEFsc28gbWFyayB1cCBmb2xsb3df
cGZuIGFzIEVYUE9SVF9TWU1CT0xfR1BMLiBUaGUgb25seSBzYWZlIHdheSB0byB1c2UKPiB0aGF0
IGJ5IGRyaXZlcnMvbW9kdWxlcyBpcyB0b2dldGhlciB3aXRoIGFuIG1tdV9ub3RpZmllciwgYW5k
IHRoYXQncwo+IGFsbCBfR1BMIHN0dWZmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGluZnJhZGVhZC5vcmc+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+IENj
OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBDYzogRGFuIFdpbGxpYW1zIDxk
YW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
PiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IEphbiBLYXJh
IDxqYWNrQHN1c2UuY3o+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzoga3ZtQHZnZXIua2VybmVsLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gLS0KPiB2NTogU3VnZ2VzdGlvbnMgZnJvbSBDaHJpc3RvcGgKPiAtIHJlaW5kZW50IGZvciBs
ZXNzIHdlaXJkbmVzcwo+IC0gdXNlIElTX0VOQUJMRUQgaW5zdGVhZCBvZiAjaWZkZWYKPiAtIHNh
bWUgY2hlY2tzIGZvciBub21tdSwgZm9yIGNvbnNpc3RlbmN5Cj4gLSBFWFBPUlRfU1lNQk9MX0dQ
TCBmb3IgZm9sbG93X3Bmbi4KPiAtIGtlcm5lbGRvYyB3YXMgYWxyZWFkeSB1cGRhdGVkIGluIHBy
ZXZpb3VzIHZlcnNpb25zIHRvIGV4cGxhaW4gd2hlbgo+ICAgZm9sbG93X3BmbiBjYW4gYmUgdXNl
ZCBzYWZlbHkKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbS5oIHwgIDIgKysKPiAgbW0vbWVtb3J5
LmMgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICBtbS9u
b21tdS5jICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgc2VjdXJp
dHkvS2NvbmZpZyAgIHwgMTMgKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDczIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbnZpZGlhLmNvbT4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
