Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF926BD8F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 08:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653B66E9B5;
	Wed, 16 Sep 2020 06:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953526E9B5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 06:58:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjZw7Uy1lziJHIcfXCVuCvLiG/9cCRQJwvstr+P+z727l5KmTL73EaQBMV6QJrhSft5EHWz3pCHrooojwaEDgivl3CmwmbID/Y1rDYK8YkwxplMks/lx2V+ZNLIKzcS1euRU940NRB0541qIL78SUvpxFox9cG9Cq8AZTb4wiR1wqWvl+MNULs54X9qTQzHsJtei3ZRSzQNZsbrVIczRwSutIjsBQiA8HfX4NMQL8JR0brecAGSfWWdyK3hj+Bh2AKbXHzX7nT0q77ZUfwCV4cHtEsE1fYxp9FifKhUt1GDwTp6YcNKqJEROlSOxUiLExpucF2B2R2VRV/DFunzJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIDvqtjxabiq2VXyk3vNOuuv8rWESBemHMx+XS64og4=;
 b=dZForJbvtT88LNQdKftCZuP4fAXHokUrHLr6Uv+NDFhCA+5oMDxCt+c2rUl7ftZKqmvEJvOGiGDQELVgisjOikpTokm3ZDIpmZ2EkPNqVIcCyH7VnCOE9+Tl6VHgXXzAj8+0xl9rJGlS+5SYBNYhFT9ueWOsQbS4xtfxnMH67bGpsgykftixHQTOY54uB3dR99fGXKrx+rxlzs5Cuy1oLeSJKt4Py7PCvf713kdxDGsqcRJYyWSefhwUAWkHHNo4Typk1zdsuX996zU2Nxg/rfA65vSCJUoeBychd6ea0GiiNLTcAPKI/GC7PETz4TxI0MCWVhz7KEWcNl4mpGg6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIDvqtjxabiq2VXyk3vNOuuv8rWESBemHMx+XS64og4=;
 b=vETTgRBOrC5YE5Tc14Z/1gZVEJ1AV+ucZvtU6TFbp3a+TeBU6KDtqGU24tRPKQZTlEQSpTaeQSYVGYK8VKThUIrOUkbnl9elwBv8sjWyAkPNLJRRRatDlz3Qs63VKJHwDuyLyeWqR10jbrilos/fyR0gokCaTQ/iGjJ6jnG5J8I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 06:58:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 06:58:19 +0000
Subject: Re: some half-baked ttm ideas
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Dave Airlie <airlied@gmail.com>
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
 <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
 <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
 <CAPM=9tySxEnV+1q=hyu4c5tSX35ZJr6TBKwfnUkQZbuw=XkrLA@mail.gmail.com>
 <85097575-b713-095d-7c09-9e4d02f5fbda@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fb34ccb6-56b6-319f-5a25-05af658b593a@amd.com>
Date: Wed, 16 Sep 2020 08:58:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <85097575-b713-095d-7c09-9e4d02f5fbda@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0084.eurprd03.prod.outlook.com
 (2603:10a6:208:69::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0084.eurprd03.prod.outlook.com (2603:10a6:208:69::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 06:58:18 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c7bae5e-5146-47fa-7716-08d85a0de4f2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB439099924581528A74258DE983210@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8aa/3fdK25sKroj5hN4cY99UP93NZ8RZ+w43KwdOM9T81f/2yiXmbifBf2e5QfOnQaw2AfgLlnw+ncxUnGAEOYHFn2ivVD6h3z1mZCsmONcT/tyW/uRisvv+oihNSSdBTk3UuHzCQFaqUINFIPHwzVOfs+eqdAK6abLUvPx/bTFiGdUD/O8IDYiAFMA9Dv6T7HmQn/aSLngxjMMCbwYWBcOqQY0AHTQwGaWG8QwlSAaql1TNuNCgOv0KtRqrMVk3yjsuj/aL2nhb/weoykcxjYIMO308KU4i45o+WVM32E1zwwGLQJljW+rLCQ80aydZ+yHwW7Zt32kw0ii8nIjBc87Nsi5eI3PTolyB9AN64VRRYvm4dRqK1/RC626JLGF0Oenf5ZirGCN6sUkSp1qDPwYXFDJTTSAAe0ZexJwB0R08cSva/kpPbBTF5isF921JpVd/oO/fHjIvtQELGhQ0Yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(6666004)(110136005)(2616005)(36756003)(66946007)(66574015)(66556008)(66476007)(478600001)(8676002)(4326008)(31686004)(83380400001)(86362001)(966005)(52116002)(8936002)(31696002)(45080400002)(5660300002)(16526019)(53546011)(6486002)(2906002)(186003)(316002)(3480700007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 3JZpvH+uHjtjS9y/X+dATCAflQpGMGaDiTrNqSpD333QmUgdc+FfmrA5R9EVwq0zTSB7E/Xb4mWKs3oo/1nrYWpO8KXCMh1XsNUuY5PU4EjtQlqLdmkRi/ir4HgCEkiotx4q3n5Vd+Wu2shZbtBNApOQpx4WOjTttJhpjJ3Wz3wFCrZ4ug9VofVha4ciAmyr8dvJEnyxnzgp3eZXOigmZ0qqTEXGPwhFfH6qq7yRbDtueUC7jbM7g2W5jL3gUtjRKg0cIRQZ/NgTLFLJzdOrpxamOUFdPAE6ncrCRMhOdtm8oQKr89NUKx/0cczha75SbuaAEJVos9ICdKBVXzTvgRGO5zhNS5V8cNq+lHhuta/+1jeYQ5qITwrvgfOE+3bh+yf0lGZ80FR/xItOrXV9C2ONEmY10RQ0wMo3Gizg+/8hP7yj5v1vRGQuyWt0XUiNOis/9bmvbfoA6DEo/ssGDITURIR3FRiZi0fYAv3o7CceJzIzkWbNjfy01Pyh2IYrBH+ZSVjYuD7xYPSrTG/Z3zz0ZiKPYc7X92heXZPMTrQe2Rwzymkgg22oRUEZUCQJSbwVi/PXXQn9BOHXTr88oYZ7jfX6Q/hZMRxBmaat6qo16spfQggH2SwUAZampUQBrFvVBFGkhXcN/L5H32H58HCmiq4r3nbZDdT0VE4IdG/DlypeTWeacDVsnDyHoJtHIJQ6+bYZU2PGlCcj7PtmZQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7bae5e-5146-47fa-7716-08d85a0de4f2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 06:58:19.7074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRq67G/2QljMKmZ7jpIpMhXlx2suTqMLM6Ymx66rUhnjl0MB805zrSA891iuUsO1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

QW0gMTYuMDkuMjAgdW0gMDg6NDQgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+
Cj4gT24gOS8xNi8yMCA2OjI4IEFNLCBEYXZlIEFpcmxpZSB3cm90ZToKPj4gT24gV2VkLCAxNiBT
ZXAgMjAyMCBhdCAxNDoxOSwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPiB3cm90ZToK
Pj4+IE9uIFdlZCwgMTYgU2VwIDIwMjAgYXQgMDA6MTIsIENocmlzdGlhbiBLw7ZuaWcKPj4+IDxj
a29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gSGkgRGF2ZSwKPj4+
Pgo+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgY29tcGxldGVseSBudWtlIHR0bV90dF9iaW5k
KCkgYW5kIAo+Pj4+IHR0bV90dF91bmJpbmQoKQo+Pj4+IGFuZCBhbGwgb2YgdGhhdC4KPj4+Pgo+
Pj4+IERyaXZlcnMgY2FuIHRvIHRoaXMgZnJvbSB0aGVpciBtb3ZlX25vdGlmeSgpIGNhbGxiYWNr
IG5vdyBpbnN0ZWFkLgo+Pj4gR29vZCBwbGFuLCBJJ3ZlIHB1dCBhIGJ1bmNoIG9mIHJld29yayBp
bnRvIHRoZSBzYW1lIGJyYW5jaCwKPj4+Cj4+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGYWlybGll
ZCUyRmxpbnV4JTJGY29tbWl0cyUyRnR0bS1oYWxmLWJha2VkLWlkZWFzJmFtcDtkYXRhPTAyJTdD
MDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzNkNmM5YWJmZmE1NTQzYTM4ODEwMDhk
ODVhMGMwMTNjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYz
NzM1ODM1NDkxMjE2MjE2OSZhbXA7c2RhdGE9a2FSMXVDM3lMRiUyRjhBVDFiZ1RwbyUyRjhBbiUy
QjB5eXdIWkJBZlhURCUyRnQlMkJNYjAlM0QmYW1wO3Jlc2VydmVkPTAgCj4+Pgo+Pj4KPj4+IGJ1
dCBJJ3ZlIGZyaWVkIG15IGJyYWluIGEgYml0LCBJJ20gaGF2aW5nIHRyb3VibGUgcmVjb25jaWxp
bmcgbW92ZQo+Pj4gbm90aWZ5IGFuZCB1bmJpbmRpbmcgaW4gdGhlIHJpZ2h0IHBsYWNlcywgSSBm
ZWVsIGxpa2UgSSdtIGNpcmNsaW5nCj4+PiBhcm91bmQgdGhlIGFuc3dlciBidXQgaGF2ZW4ndCBo
aXQgaXQgeWV0Lgo+PiBkcm0vdHRtOiBhZGQgdW5iaW5kIHRvIG1vdmUgbm90aWZ5IHBhdGhzLgo+
Pgo+PiBJbiB0aGF0IHRyZWUgaXMgaW5jb3JyZWN0IGFuZCBJIHRoaW5rIHdoZXJlIHRoaW5ncyBm
YWxsIGFwYXJ0LCBzaW5jZQo+PiBpZiB3ZSBhcmUgbW92aW5nIFRUTSB0byBWUkFNIHRoYXQgd2ls
bCB1bmJpbmQgdGhlIFRUTSBvYmplY3QgZnJvbSB0aGUKPj4gR1RUIGF0IG1vdmUgbm90aWZ5IHRp
bWUgYmVmb3JlIHRoZSBtb3ZlIGhhcyBleGVjdXRlZC4KPj4KPj4gSSdtIGZlZWxpbmcgYSBtb3Zl
X2NvbXBsZXRlX25vdGlmeSBtaWdodCBiZSBhbiBpZGVhLCBidXQgSSdtIHdvbmRlcmluZwo+PiBp
ZiBpdCdzIGEgYmFkIGlkZWEuCj4+Cj4+IERhdmUuCj4KPiBJIGRvbid0IGtub3cgaWYgdGhpcyBj
b21wbGljYXRlcyB0aGluZ3MgbW9yZSwgYnV0IG1vdmVfbm90aWZ5IHdhcyAKPiBvcmlnaW5hbGx5
IG9ubHkgdGhvdWdodCB0byBiZSBhbiBpbnZhbGlkYXRpb24gY2FsbGJhY2ssIGFuZCB3YXMgbmV2
ZXIgCj4gaW50ZW5kZWQgdG8gZHJpdmUgYW55IG90aGVyIGFjdGlvbnMgaW4gdGhlIGRyaXZlciB0
aGFuIHRvIGludmFsaWRhdGUgCj4gdmFyaW91cyBHUFUgYmluZGluZ3MuCgpBbmQgZXhhY3RseSB0
aGF0J3Mgd2hhdCB3ZSBuZWVkIHRvIGNoYW5nZS4gU2VlIFRUTSBvciBtb3JlIHByZWNpc2VseSB0
aGUgCmV2aWN0aW9uIGhhbmRsaW5nIHNob3VsZCBvbmx5IG1hbmFnZSB3aGVyZSBidWZmZXJzIGFy
ZSBsb2NhdGVkIGFuZCAKbm90aWZ5IHRoYXQgZHJpdmVyIHRoYXQgc29tZXRoaW5nIG5lZWRzIHRv
IG1vdmUuCgpNYW5hZ2luZyB0aGUgd2hvbGUgYmluZGluZy91bmJpbmRpbmcgYW5kIGFjdHVhbGx5
IG1vdmluZyB0aGUgYnVmZmVyIAphcm91bmQgaW5zaWRlIFRUTSB3YXMgYSBiYWQgaWRlYSB0byBi
ZWdpbiB3aXRoLgoKSW4gb3RoZXIgd29yZHMgd2UgaGF2ZSBkb21haW5zIEEsIEIsIEMuLi4uIGFu
ZCBtYW5hZ2Ugd2hpY2ggQk9zIGFyZSAKaW5zaWRlIHRob3NlIGRvbWFpbnMgYW5kIGNhbiBiZSBl
dmljdGVkIHdoZW4gbmVjZXNzYXJ5LgoKSWYgdGhlIG5lZWQgYXJpc2UgdG8gZXZpY3Qgc29tZXRo
aW5nIHRoZSBkcml2ZXIgZ2V0cyBhIG5vdGlmaWNhdGlvbiAKd2hpY2ggQk8gd2FzIHBpY2tlZCBm
b3IgZXZpY3Rpb24gYW5kIGFjdHMgYWNjb3JkaW5nbHkuCgpUaGlzIG1lYW5zIHRoYXQgdGhlIGV2
aWN0aW9uX3ZhbHVhYmxlLCBldmljdF9mbGFnLCBtb3ZlX25vdGlmeSwgYmluZGluZywgCnVuYmlu
ZGluZyBldGMuLi4gY2FsbGJhY2tzIHNob3VsZCBiZSByZW1vdmVkIGluIHRoZSBsb25nIHRlcm0u
CgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gVGhlIGlkZWEgd2FzIHRoYXQgVFRNIHNob3VsZCBy
ZWFsbHkgbmV2ZXIgc2V0IHVwIGFueSBHUFUgYmluZGluZ3MsIGJ1dCAKPiBqdXN0IHByb3ZpZGUg
bWVtb3J5IHdoZXJlIGl0IHdhcyBncHUtYmluZGFibGUgYW5kIG1ha2Ugc3VyZSBpdCB3YXMgCj4g
Q1BVLW1hcHBhYmxlIHdoZXJlIG5lZWRlZC4gVGhlICJleGNlcHRpb24iIHdhcyBtYXBwYWJsZSBB
R1AtdHlwZSAKPiBncHUtYmluZGluZ3MsIGZvciB0aGUgc2ltcGxlIHJlYXNvbiB0aGF0IHRoZXkg
d2VyZSBuZWVkZWQgdG8gcHJvdmlkZSAKPiBDUFUtbWFwcGluZ3Mgb24gc3lzdGVtcyB3aGVyZSB5
b3UgY291bGRuJ3QgbWFwIHRoZSBwYWdlcyBkaXJlY3RseS4gQnV0IAo+IHNpbmNlIHdlIHNldCB1
cCBhIEdQVSBtYXAgb24gdGhlc2Ugc3lzdGVtcyBhbnl3YXksIG1hbnkgKG1vc3QpIGRyaXZlcnMg
Cj4ganVzdCBtYWRlIHVzZSBvZiB0aGF0LCBidXQgb3RoZXJzIHRvb2sgdGhlIHN0ZXAgZnVydGhl
ciBpbnNpc3Rpbmcgb24gCj4gdXNpbmcgbW92ZV9ub3RpZnkoKSB0byBzZXQgdXAgR1BVIGJpbmRp
bmdzLCB3aGljaCB3YXMgbmV2ZXIgaW50ZW5kZWQgCj4gYW5kIGFkZHMgZXJyb3IgcGF0aHMgaW4g
dGhlIFRUTSBtb3ZlIGNvZGUgdGhhdCBhcmUgcHJldHR5IGhhcmQgdG8gZm9sbG93Lgo+Cj4gU28g
aWYgd2UncmUgY2hhbmdpbmcgdGhpbmdzIGhlcmUswqAgSSdkIHZvdGUgZm9yIHRoZSBmb2xsb3dp
bmc6Cj4KPiAqIERyaXZlciBjYWxscyB0dG1fYm9fdmFsaWRhdGUgdG8gcHV0IG1lbW9yeSB3aGVy
ZSBpdCBpcyBjcHUtbWFwcGFibGUgCj4gYW5kIGdwdS1iaW5kYWJsZQo+ICogT24gc3VjY2Vzc2Z1
bCB2YWxpZGF0ZSwgZHJpdmVyIHNldHMgdXAgR1BVIGJpbmRpbmdzIGl0c2VsZi4KPgo+ICogbW92
ZV9ub3RpZnkgb25seSBpbnZhbGlkYXRlcyBHUFUgYmluZGluZ3MgYW5kIHNob3VsZCByZWFsbHkg
cmV0dXJuIGEgCj4gdm9pZC4KPgo+IFNvIHRoYXQgYmluZCgpIGFuZCB1bmJpbmQoKSBzdHVmZiBp
cyByZWFsbHkgb25seSBuZWVkZWQgZm9yIGNwdS1tYXAgCj4gdGhyb3VnaCBhcGVydHVyZS4gSWYg
d2UgZGl0Y2ggdGhhdCwgdGhlbiB3ZSBuZWVkIHRvIHJlLWRlZmluZSB0aGUgdGFzayAKPiBvZiBU
VE0gdG8gcHJvdmlkZSBtZW1vcnkgaW4gYSBjcHUtbWFwcGFibGUgbG9jYXRpb24gYW5kIGZpZ3Vy
ZSBob3cgCj4gZHJpdmVycyB0aGF0IHJlcXVpcmUgY3B1LW1hcC10aHJvdWdoLWFwZXJ0dXJlIHNo
b3VsZCBoYW5kbGUgdGhpcywgCj4gc2luY2UgdGhleSBjYW4ndCB1c2UgdGhlIFRUTSBmYXVsdCBo
YW5kbGVyIGZvciB0aGF0IG1lbW9yeSBhbnltb3JlLiAKPiBUaGUgc2FtZSBob2xkcyBmb3IgZHJp
dmVycyB0aGF0IHdhbnQgdG8gbWFuYWdlIHRoZWlyIHRyYW5zbGF0aW9uIHRhYmxlIAo+IHRoZW1z
ZWx2ZXMsIGFuZCBuZWVkcyBzb21lIGNwdS1tYXBwaW5nIG9wZXJhdGlvbnMgdG8gZ28gdGhyb3Vn
aCB0aGUgCj4gYXBlcnR1cmUgcmF0aGVyIHRoYW4gdG8gdGhlIHBhZ2VzIGRpcmVjdGx5Lgo+Cj4g
SWYgdGhlIGRyaXZlciBoYXMgbm8gc3BlY2lhbCBjcHUtbWFwcGluZyByZXF1aXJlbWVudHMsIGl0
IHNob3VsZCBiZSAKPiBwZXJmZWN0bHkgbGVnYWwgZm9yIGl0IHRvIG5vdCBwcm92aWRlIGFueSBi
aW5kKCkgb3IgdW5iaW5kKCkgCj4gZnVuY3Rpb25hbGl0eS4KPgo+IC9UaG9tYXMKPgo+Cj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRw
czovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmktZGV2
ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDM2Q2Yzlh
YmZmYTU1NDNhMzg4MTAwOGQ4NWEwYzAxM2MlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRl
MTgzZCU3QzAlN0MwJTdDNjM3MzU4MzU0OTEyMTYyMTY5JmFtcDtzZGF0YT1OcFNocklqMFNFRDFS
OFY0SllEQVVhczdtNWpFQllNME1HalN4blUlMkZERmMlM0QmYW1wO3Jlc2VydmVkPTAgCj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
