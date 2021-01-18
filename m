Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E356A2F9AD8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 08:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977B6E0F5;
	Mon, 18 Jan 2021 07:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08226E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 07:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5WTIzS2XhM+w6qio2FxCgd3wI82KdazuryRirSYvy2veaX0SSmzQIn1BooBGmRklGvoIw0fJZuY1xH6aD+r0RE73x7gficvcz2ehQjQSPoOYD2+rn0NQxu+JrHOX+ICkBTz1VsQuONOFrVO9ZudTAy7Kczps/EPcBbgvD7V+H+QVpITTdWQVPHBhasWLmJ2nD4VJbfVzK6F06gqryxud2SL3CdcofybXqp0ATyZvRyq9sDN6d+Q6+7IxCtS3NfwJ2vAVN7tUdIJsqp9l5yipa9R/mNokXsMt6SjeDc1vj1pGR/09CKoM80pZ3SCUunWonVFkj44zpBjNdBYBXxvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rb0dO5gjrpnNkbzu5H191bydD6eg8YnDqRBFe7RZ33M=;
 b=ILKmNbaNdrEis5/bVt4bK+ZqpCyU6f5CFgxn3IJKif+Vs2BudM+Az+SGjW57hb21KHR6t4NSv2Qi/2qADLRSb0edNyv16h/pxFvkoZDp4EBH0xcl+/kBHbu4qapHaB1UyV5rMCWZLHQdcGDMv9jvrsWhBhengUok5iJS6oFvF7g9sfsxaXCDi7il5oxp+BIydGErVqGbumDllfdkGC6rQPGKVbvTC/9sKGDNLXWhVEfe4iE7o8i8Y8jvOT9IqOqSOHwbg5bMrA4vbCNiLiuXdEjMPp2HBR/fQRd6oUsYAAeFM+rgjM5xnQ4hca1BCsneznbfMxd0XH2H0RhkvAO1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rb0dO5gjrpnNkbzu5H191bydD6eg8YnDqRBFe7RZ33M=;
 b=x4nM4WQq/ZQLjhIpBVMMQZSprVf+yuWEnyMuxAjNecVTVguKxIKt4iBS5pALsTa6vwERdrj25BrcQs/CEv/bPhzZxfFRcjpB4wdS0NZrRv+xK26PztaeJBMFki/YD/klON6ZO7eBuEubwlxq2R1WXUryH0XGLnAd7OEfpDBwl74=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3966.namprd12.prod.outlook.com (2603:10b6:208:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 07:57:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 07:57:35 +0000
Subject: Re: Change eats memory on my server
To: Eli Cohen <elic@nvidia.com>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
 <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
 <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
 <20210118074913.GA39161@mtl-vdi-166.wap.labs.mlnx>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a39c1b62-3e22-2454-d68b-e9eb510891d3@amd.com>
Date: Mon, 18 Jan 2021 08:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210118074913.GA39161@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0145.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0145.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Mon, 18 Jan 2021 07:57:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e9bc7e3-8b1f-49b2-d2b7-08d8bb86b796
X-MS-TrafficTypeDiagnostic: MN2PR12MB3966:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3966B95D59EB786FCE563D9983A40@MN2PR12MB3966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ea7gO+vM45PYPMNgzkMyTTqIExkkSbL7owi5M0j6Q0XqhMYqqI+M/NbfaygsWxhn4c0M03BnfVdEQwTH/ivmVBaGJmvy0Fi5SMYErq9w1YbJnPp2Ck7/tVJVj/HlqwbNrV/hPRXEwpsLeQysHY7fmbnNobQsnlOCgaV16FnKAU9Q8efEERYtGBTBF2aKT+b7p3AS+DwIAC3TdurkH3xWXKmvX6Bl9l1JAF2leJI8COBwfk6nDC4SLcURxiU3ike/kfeA1vXkQmAjIjHL40uH46oXNKC5lbEpOV8b7TSeo6XPeJsxJYgj2ewDfw6opWJrQ/GRM01uVMONsdgJx4IzlcdDTCNuK52kK1Z7iihNBdEm4qrwS1lIqVLBw7oexnZ4jnpJXkOwPjmd3vyN1zTmglWSUNTXSALOwQbE1qKCUA7QzayXAQ7B8phAd8oQEbfq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(16526019)(31686004)(4744005)(5660300002)(4326008)(6916009)(316002)(8936002)(478600001)(6666004)(66946007)(66476007)(66556008)(54906003)(86362001)(8676002)(6486002)(186003)(52116002)(36756003)(2906002)(31696002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnRCVytjNVlqWnVUUnVPZHpwSnVqOGJiNVZvT2ErajZrZzdTZk9aWHpxUFlt?=
 =?utf-8?B?ZWZaNHdyUUVDOWxUaDZNSkhaSXZMTHp0dlNQU210c1J4Tm1IU0JPNEdUam1R?=
 =?utf-8?B?alhGUmdycTkxRzdLMDdORElySnlaS0U3Umo2T0dnR0hheU9GRVN4SVpTUU9m?=
 =?utf-8?B?VHdDN1kzQTBRb3FJSUNaeUJPZnNNNE1nN0VzYWNSVkYwWlNJeGxxUlhrZ3ZM?=
 =?utf-8?B?RDdYUXZKWUwyc01FVy9xY1RtZlFvRWZCYmNLaEtzbTQ4SWNYd1djVyswQnpO?=
 =?utf-8?B?dU1QSVE0MDFhR1JVRlVkb1h3WkdCQWQ5RCt5U2pPTGt6UUVXL2dZUkxyZjNT?=
 =?utf-8?B?cFRuSk4rWWp6TWxjRVNEaXpORUVxT3EzZ1l1M1V1QWZvMmx4NkR2c1pIdEdD?=
 =?utf-8?B?YW41WmtzeDJhTFBCVDlva3lxQjRhRmd2M3Z3MU5lQUtlWi9RMjM0ZzQ4Vm03?=
 =?utf-8?B?V05yWVRuV0RQdWVxMnZJWDlXQTBWeTJSMG1SeWVUSmVxRHplZVJ6ZG1aQTRi?=
 =?utf-8?B?RDZWSktxdjFZRit0cVdxTWgxWFQxbStiWFcreXI4eFdHaStmclprYUJ4MERN?=
 =?utf-8?B?ZFBBdTltbG9FTWEzQWZVV2trVjIvMXY5anp0elh3UmNOMFhzaFNRQ29YRUFj?=
 =?utf-8?B?RHNUSHdhR3hFNjFsSXpOclhoaS9lUG9RVDM5WVZHYU5zeWxpS2VvMlZPWllT?=
 =?utf-8?B?Y01jdndiYStPd2lSSWxSZmp6N2d5OVlmcnNNd2c1OVAwT2E3eHQ5bTZqRy9j?=
 =?utf-8?B?UG5BMVFpVlYzQ09wdUtPa0VmWnBjWUluWVJXOFBUM0p0SmZPdngwTDNzMThv?=
 =?utf-8?B?TVNXazE2MWJGbnQ3cnIxMFdkM2wvNVR0c3ZGWFVVVGZQMTJpOHRKMTVHWG0z?=
 =?utf-8?B?VVpRQTVtQ0tRRW5xellrTlhqU0psWE5CTWpiY2JYUGNGSE8rNE9rNG9oUG5B?=
 =?utf-8?B?N1hrNmU4VHhheUFZaytWTkVRdUxFV2R2ZnlPRm9VRVl0Z0ppSWNtUWtLa2hn?=
 =?utf-8?B?aUphdkVXWEtlR24xNGNITFBoUHRaYStxR0VKTUVKV1FJZWdkc3hNUjRxRUY2?=
 =?utf-8?B?dFJuODlyRlNHVnVLSFZpZHEyMys1eldmaW0xOTFnWjVNU1lqZkdEM0RzdWpv?=
 =?utf-8?B?a2hxZFRLSGNRTVRXelZoS2JxK0dYbmhJMjhWeTlQZ3BFVHRacWVScnROdGZ5?=
 =?utf-8?B?T3lPS2pRYXZSY3NESFY2MnptdEdXUWd4a1lwTnhtbFkxRWxLTnJCYzdlMVhu?=
 =?utf-8?B?NWNudWlmaHRIcUhEaEs5TTdkaTVPSGtMYTBWVEYvU0NIOVdtNzJqVnk5NGtU?=
 =?utf-8?B?QjZsU2NMZ25SR0d5bHV6QitpODhXS2JrZjJsTGlXc1gzUmVDUG5ZUDZVRmlD?=
 =?utf-8?B?aW1NbWVYZjM5Mm1vcDdqaVVUNXhTVFBsbFM3U3Rxczc3OVJSTlJwbjR3ZzBM?=
 =?utf-8?Q?x/Dml8r8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9bc7e3-8b1f-49b2-d2b7-08d8bb86b796
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 07:57:35.5360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDHuRiizjNywB49d14ivOrOQ1/Bre3fBhCIIq/mXHexQ+b9AxNWj9KSEfjDSXAEU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3966
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDEuMjEgdW0gMDg6NDkgc2NocmllYiBFbGkgQ29oZW46Cj4gT24gTW9uLCBKYW4gMTgs
IDIwMjEgYXQgMDg6NDM6MTJBTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gSGkg
RWxpLAo+Pgo+PiBoYXZlIHlvdSBhbHJlYWR5IHRyaWVkIHVzaW5nIGttZW1sZWFrPwo+Pgo+PiBU
aGlzIHNvdW5kcyBsaWtlIGEgbGVhayBvZiBtZW1vcnkgYWxsb2NhdGVkIHVzaW5nIGttYWxsb2Mo
KSwgc28ga21lbWxlYWsKPj4gc2hvdWxkIGJlIGFibGUgdG8gY2F0Y2ggaXQuCj4+Cj4gSGkgQ2hy
aXN0aWFuLAo+Cj4gSSBoYXZlIHRoZSBmb2xsb3dpbmcgY29uZmlndXJlZCBidXQgSSBkaWQgbm90
IHNlZSBhbnkgdmlzaWJsZSBjb21wbGFpbnQKPiBpbiBkbWVzZy4KPgo+IENPTkZJR19IQVZFX0RF
QlVHX0tNRU1MRUFLPXkKPiBDT05GSUdfREVCVUdfS01FTUxFQUs9eQo+IENPTkZJR19ERUJVR19L
TUVNTEVBS19NRU1fUE9PTF9TSVpFPTE2MDAwCj4KPiBBbnkgb3RoZXIgY29uZmlndXJhdGlvbiB0
aGF0IEkgbmVlZCB0byBzZXQ/CgpBcyBsb25nIGFzIHlvdSBkb24ndCBoYXZlIGFueSBrZXJuZWwg
cGFyYW1ldGVycyB0byBlbmFibGUgaXQgSSB0aGluayB5b3UgCm5lZWQgdG8gZG8gImVjaG8gc2Nh
biA+IC9zeXMva2VybmVsL2RlYnVnL2ttZW1sZWFrIiB0byBzdGFydCBhIHNjYW4uCgpUaGUgcmVz
dWx0IGNhbiB0aGVuIGJlIHF1ZXJpZWQgdXNpbmcgImNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9rbWVt
bGVhayIuCgpSZWdhcmRzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
