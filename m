Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9B319ADF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 08:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A2F6E527;
	Fri, 12 Feb 2021 07:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BC36E527
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 07:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr+7gN515nGPOoxfSWNC4+0Y+uUccCHtRHZaooniZtx0z8eNqLMRLNoDO4kmhLEaRuQjYmaALMorYt0416xMdABxej6lwyjLSpy5+uuCZGeu+P0NeKwkU0906vxVTl2zgKDOoLGKunEVH7DPrEbUuD3adF2l27TWAJRGbgBdemDYpFlfjhrT1a+7/Yb+E5w3SGlGUDF30SvnCSaCAMb7qRs/bMcjkbV0N8YTCPDOWmoUEjLPkZ0EYPbulhZ4DuBjFoCrxRz4N6xbItgv0LW1HqiapBh6zZLgt3+maxCMDCSEpjuOYbCaD0Z94k5Fq86Lv7KPYyyZr7on7NuK9ytjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ztbr9aUPql3r01GWsqt4wg4+HY6I2QJAvWMvqxjKOM=;
 b=kkUmjNIE/DTx3xVOIw65IRbHPlIWZpiCu05N2sAJpKyIHfHj1hKOmlCtAxCJXFgeXUTdsM292AbmFFbtVfzTKDB9S2cDY6bxJQOtiVC4DTuTkLiT0G2CfgRbPOpHRzIHHi16Q6etEZtHf0FbByDj7YpJQdW6M8zasAgh6s6NY2egBg2jZ4/bxlIR4s5p3+nm663EUMz7HuJCrtzK7xBtcc5YMroSbOhDnLKHwuONKMpWTsArOZ8zUq8PFTEvqcg5a24kqnVs1ukcHmeEb5HcPcgqfDtCshRtbyz7sfyo4A84+yVZY9YFAO1HGpN3stODeWT7ehrzvtGvFq+IFreTKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ztbr9aUPql3r01GWsqt4wg4+HY6I2QJAvWMvqxjKOM=;
 b=ko1xMzgN+91qZzUqsbkvwfz9N9nEJAlW+JNooampk9nYq9s56v6vX6A87dWowSGX0Nw5fiGSCF7eROpXJBtNunW2YtLogrpAjCTETr8i+j8EUNMc1cTd3ltykpFQKuIduczP5uurJmSnqwrrgJWcFdsutwxVdHdKQp2gfnzBu3Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 07:51:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.027; Fri, 12 Feb 2021
 07:51:30 +0000
Subject: Re: Not 100% sure if I correctly fixed drm-tip
To: Daniel Vetter <daniel@ffwll.ch>
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
 <87o8gqd4vw.fsf@intel.com> <3b20fc5a-e6ff-d1f9-a4f6-6b5c21ca94fc@amd.com>
 <CAKMK7uEAMST0dOzFDuRYoDh=QgGDQm-7qepfaF+wAnJwbSTGzw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <64da0f52-e2e9-b7cb-d104-52079896041a@amd.com>
Date: Fri, 12 Feb 2021 08:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEAMST0dOzFDuRYoDh=QgGDQm-7qepfaF+wAnJwbSTGzw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:5e65:14a3:85f5:f2bf]
X-ClientProxiedBy: AM4PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:205::24)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:5e65:14a3:85f5:f2bf]
 (2a02:908:1252:fb60:5e65:14a3:85f5:f2bf) by
 AM4PR05CA0011.eurprd05.prod.outlook.com (2603:10a6:205::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Fri, 12 Feb 2021 07:51:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd35e5a7-4ab7-4ca8-261f-08d8cf2b020c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4205:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42057A9EAD94C50C913ED718838B9@MN2PR12MB4205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljQTSz/oOJ8wipxUbL2rtoeHdJsFqppzW+fpe/SVtgwYrHV/Dc1meLCSvBkcDocXIuE4cFtOsZCWXgj0dvpOOVf80SwrLa4BrClRS9KAOYVqHj0kgntB1q3A2E2TDYOZjohT4S5AbbgX7TRspyHcSdPwSbhGF5oEiKrnD3umCbuzjm3Xl+3WTseCBsew5UxMQ/Hk1YdnqCrnVfYfO63qSxraBWla4QBNU9G27nTNACsh53b302tfJPzh76Ditr022PAw7Ry0RNY0QVuO9h6D8+bVAhpLX6YAuwuGRqqU1GHAkzPqBbBed2FDhJeBrQ/DVTCsNshV8/BXtvdc66hgWonCOccsVcXuq5B9FPARI24mm8x/mAMzmgAUBbDq3OZMAbPqW5sq/Qk3deKCJhYeXdyift9lR04HdapgwXNkCk/q8mx0Sd8cmxIgdy5NywcTCcCzljEy1wsvRmnkQo2pykIz1YicpxJjYt0DFwBAsvqlu6zVCQUEtgORBT1GYs0E8b7EzpMeOtOr5ho/KqEI4WYxsIrimrgaF0s0oSEUTrDKgLD382NX5ZCflpOmqe0nRkdPolYtsD3tiIoAwXqNlob47DH6WhdOY6fgSU2vtQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(6486002)(316002)(54906003)(52116002)(4326008)(31686004)(36756003)(8676002)(53546011)(66574015)(66476007)(6916009)(5660300002)(478600001)(66556008)(8936002)(186003)(16526019)(86362001)(83380400001)(6666004)(31696002)(66946007)(2616005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OCtSU2hHa0lpbGp2K0Y4clNJSFg1Zk0vYmpKQmhPNjlYOVdZejRlL3M3NVBT?=
 =?utf-8?B?aWs2ZUVBNkZzaDhsUHR6QnYwb28wbWFmeElYZGZyMmNMeWg5Wm9Na3F2akxB?=
 =?utf-8?B?UzM1OVdBZHBjM1BoUUtpRDk4WEJLOHFGSnhRd2VpKzdlSG5sa0tweXk5d1Nt?=
 =?utf-8?B?Qk5VdWlNYVJCZkFPQ2hWZU1IWExod2U3RmpyNkRKRUxZU0x5NU5OdEpRQjJH?=
 =?utf-8?B?YVdOV1MvRkQ1RzR3OG12WWlsQTdmV3FubEdaeEoxaGNLb29HbXEzL29GaEti?=
 =?utf-8?B?eHJYYUZ2R2w5R1lIN2pPNUI2cmlvOHZCRXVXYjRmc1NNOFVLOHh4QXI1eldt?=
 =?utf-8?B?NjVCckJZUWJpVmRueWptT3dyajhkUFNRS1RDOWMraTQ5cXpQQndHS05BQllQ?=
 =?utf-8?B?MXRKRk1PUXQ1WG8wVVJvQXFNblJxdkZyMXA2Vm5TYnBQY2lIVU90bXJSNTVJ?=
 =?utf-8?B?V1JycHU5VVNzcnNjbkJTUG5SWlZpTit3amlPUW8rT1FtQTRoKzFWWW9SblZQ?=
 =?utf-8?B?aWVTTFA3SkNTRGFsL1B2UkxMdlRvMGxIWk4vcGNOeUdZVVJ0OVpnS3RieVJX?=
 =?utf-8?B?bngvK1dYQm5zRHRkckZwcEJ0SFRnWnF1b2NNZHB1cGNCeE5zamQraHl6U1lJ?=
 =?utf-8?B?U2pVWjUrN1JVS3p2eGp4REhzbHkyemw1ajNZL3BVb1FRNDRkR0wvR3I3REMr?=
 =?utf-8?B?NE52MlQ1VU5LL0QydEpEYVY1YTBMSVlaTGU2MVp5dGlMdllOanRjYmgvb3Vr?=
 =?utf-8?B?ZHNWRmZwaG5vZmViSW9KZ1hHemVSU0dMbWNGT21sNlBtT29KU3Mxa05mU3d6?=
 =?utf-8?B?TTRqRVpqMXg0YTVtQjhncExrK3JoY0p4eEtGaE1admdsZWU1N1pGdE5wZUZy?=
 =?utf-8?B?YW9Wdng0Zy9kTWNXVWIxSXZvemhBLzJKeis3dkxQQjZqbGt5bFRZcjlueXFI?=
 =?utf-8?B?UEJXOEtGM1RzOXV4QS8wUTNDNGJHVEtWRXhHeWR1d0NpL3U2UlEwWFAwenda?=
 =?utf-8?B?TXNwRjlXcXdPem1PNDZHQnJERzlQdjdCUzJ3eHR5K3VBOWdUWjRnNmhxZktR?=
 =?utf-8?B?MWo0R0N6VUFsSVFXS0ZrQ1NITFBSUjJqT1hoZjNiTkpKa2RYbWZnaXl6WlNm?=
 =?utf-8?B?M2xCcjZlQW85bkZ3UU1mTnRpOEllTnQzb1FHM2tTM1h2WGJEcnpURmdBSzUz?=
 =?utf-8?B?bFZaZGo1eHNvRVVITzZuazlWVEtrUDgrMlZpUE51UUVWK2I5cHRjeFRRWjVW?=
 =?utf-8?B?UzZqSUJJZThvRy9YUTc3M1VZQmlINWJDZUsxZ05CM1NBMlM4T2VkV0gzYVIx?=
 =?utf-8?B?M3IwYjNGQ2pxeTJucUo4L1pUYkozd2s5Q29RbGttcEIxS0lhZmRQUTBHbGhm?=
 =?utf-8?B?K2U1aVJ1d3lBaEMrc0J3RHhlS2VrVlN0U05Rdy9WYjFwaXd2alIxZTRWdTJu?=
 =?utf-8?B?Q0VTYnM0bkxrOVk2M3A4OVd3ZnhYYnJuYkF6aFlPQ2E4emxHZmhOUjdKbmJ5?=
 =?utf-8?B?Qkt1bXlCam1ETUlVVUo5V1hHaGF3QURqODl0ZTJyRTJPNjF3dVppRzVtbm5z?=
 =?utf-8?B?VnNGRGE5c0dMWTVLZXpNNGtPQlBmbDBQUURHMlNPSG9XR3J5UlVVWnBqcUJq?=
 =?utf-8?B?anJnREVqaGVMWUU4RXdxbDlqM09GeE40TzNUamQ4TzZ2S2F2ZDZhTTU5VjZN?=
 =?utf-8?B?bXpObTV0Z1NtSkFxNnZXcEZyTjJkV1JjSEZmSjdLYnBqWkFNTjQyTGx6MnZN?=
 =?utf-8?B?OFp0R054SEk1WXhaUC9vZVJWTEp2ZVdhZ1FnTitPS3k4VTdwZVljdUJnU1di?=
 =?utf-8?B?NHFROWRqUHBzMkVuS3lJUjFRc1B4dkJ2eVVtaFRLRFNnbnF0cUszbkJQbkZn?=
 =?utf-8?Q?6lPBKrAty6vu+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd35e5a7-4ab7-4ca8-261f-08d8cf2b020c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 07:51:30.0667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hodI20crSweE0F44ERfVIpP9F/AjpcyJhKr4O6qXr9NHqvA5RIQRt4NtbwKl0pVg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMS4wMi4yMSB1bSAxODoyMiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gVGh1LCBG
ZWIgMTEsIDIwMjEgYXQgNDoyNyBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IEFtIDExLjAyLjIxIHVtIDE2OjAyIHNjaHJpZWIg
SmFuaSBOaWt1bGE6Cj4+PiBPbiBUaHUsIDExIEZlYiAyMDIxLCBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Pj4+IEhpIGd1eXMsCj4+Pj4KPj4+PiBJ
IGhhZCBhIGNvbmZsaWN0IHRoaXMgbW9ybmluZyBpbiB0aGUgdHRtIHBvb2wgd2hpbGUgcHVzaGlu
ZyBhbiBpbXBvcnRhbnQKPj4+PiBmaXggdG8gZHJtLW1pc2MtZml4ZXMuCj4+Pj4KPj4+PiBJJ20g
bm90IDEwMCUgc3VyZSBpZiBJIGNvcnJlY3RseSBmaXhlZCB1cCBkcm0tdGlwLiBIb3cgY2FuIHRo
aXMgYmUKPj4+PiBkb3VibGUgY2hlY2tlZD8gQW5kIGhvdyBjYW4gaXQgYmUgZml4ZWQgaWYgdGhl
IG1lcmdlIGhhcyBnb25lIGJhZD8KPj4+IEknbSBhZnJhaWQgdGhlcmUncyBhIHByb2JsZW07IGJi
NTJjYjBkZWM4ZCAoImRybS90dG06IG1ha2UgdGhlIHBvb2wKPj4+IHNocmlua2VyIGxvY2sgYSBt
dXRleCIpIGluIHVwc3RyZWFtIGFuZCBkcm0tbWlzYy1maXhlcyBjcmVhdGVzIGEgc2lsZW50Cj4+
PiBjb25mbGljdCB3aXRoIGJhMDUxOTAxZDEwZiAoImRybS90dG06IGFkZCBhIGRlYnVnZnMgZmls
ZSBmb3IgdGhlIGdsb2JhbAo+Pj4gcGFnZSBwb29scyIpIGluIGRybS1taXNjLW5leHQsIGNhdXNp
bmcgdGhlIGxhdHRlciB0byB1c2UKPj4+IHNwaW5fbG9jay91bmxvY2sgb24gYSBtdXRleC4KPj4+
Cj4+PiBCdXQgd2hpbGUgeW91IGhpdCBhIGNvbmZsaWN0LCBpdCBkb2VzIGxvb2sgbGlrZSB0aGUg
Y29uZmxpY3QgYnJlYWtpbmcKPj4+IHRoZSBidWlsZCBpcyBzaWxlbnQsIEFGQUlDVCB0aGUgc3Bp
bmxvY2sgcGFydCBkb2VzIG5vdCBjb25mbGljdC4gU28gYQo+Pj4gZml4dXAgcGF0Y2ggaW4gZHJt
LXJlcmVyZSBpcyBwcm9iYWJseSBuZWVkZWQgdW50aWwgdGhlcmUgYXJlIHNvbWUKPj4+IGJhY2tt
ZXJnZXMuCj4+IFdlbGwgZXhhY3RseSB0aGF0J3MgdGhlIGlzc3VlLiBJJ3ZlIGFscmVhZHkgaGFk
IGEgZml4dXAgaW4gZHJtLXJlcmVyZQo+PiBmb3IgdGhpcy4KPj4KPj4gQnV0IHRvZGF5IEkndmUg
cHVzaGVkIGFub3RoZXIgZml4IHRvIGRybS1taXNjLWZpeGVzIHdoaWNoIGFsc28gY29uZmxpY3Rz
Cj4+IHdpdGggYmEwNTE5MDFkMTBmICgiZHJtL3R0bTogYWRkIGEgZGVidWdmcyBmaWxlIGZvciB0
aGUgZ2xvYmFsIHBhZ2UgcG9vbHMiKS4KPj4KPj4gSSd2ZSBmaXhlZCB0aGlzIHVwIGFzIHdlbGwg
YW5kIGNvbW1pdHRlZCB0aGUgc29sdXRpb24uIEJ1dCBkaW0gdGhlbgo+PiBjb21wbGFpbmVkIHRo
YXQgdGhlIG9yaWdpbmFsIGZpeHVwIGlzIG5vdyBub3QgYXBwbGljYWJsZSBhbnkgbW9yZSAod2hp
Y2gKPj4gaXMgdHJ1ZSBhcyBmYXIgYXMgSSBrbm93KS4KPj4KPj4gVGhpcyBzb21laG93IHdlbnQg
YXdheSB3aGVuIEkgc2FpZCB0aGF0IGRpbSBzaG91bGQgYXNzdW1lIHBhdGNoCj4+IHJldmVyc2Fs
LCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoYXQncyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uCj4gTm90
aGluZywgaXQncyBhbGwgc3RpbGwgYnJva2VuLiBZb3UgbmVlZCB0byBkZWxldGUgdGhlIG5vdyB1
bmVjZXNzYXJ5Cj4gZml4dXAuIEFzIGEgcnVsZSwgd2hlbiByZWJ1aWxkaW5nIGRybS10aXAgZmFp
bGVkIGFsd2F5cyB0cnkgYWdhaW4gdG8KPiBjb25maXJtIHRoYXQgd2hhdCB5b3UndmUgZG9uZSBh
Y3R1YWxseSBmaXhlZCB0aGluZ3MgKHNpbmNlIHNvbWV0aW1lcwo+IGdpdCBjYW4gYWxzbyBub3Qg
cmVtZW1iZXIgd2hlcmUgdG8gYXBwbHkgdGhlIHJlc29sdXRpb24gZm9yIHNvbWUgb2RkCj4gcmVh
c29ucykuCgpNeSBxdWVzdGlvbiBpcyBob3cgdG8gSSByZW1vdmUgdGhlIGZpeHVwIG5vdz8KCkUu
Zy4gd2hlcmUgY2FuIEkgZmluZCBpdD8KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+IEknbSBmaXhp
bmcgdGhpcyBub3cuCj4gLURhbmllbAo+Cj4+IFRoYW5rcywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4K
Pj4+IEJSLAo+Pj4gSmFuaS4KPj4+Cj4+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
