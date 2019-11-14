Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973BFCAE6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 17:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976D26ECB0;
	Thu, 14 Nov 2019 16:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680071.outbound.protection.outlook.com [40.107.68.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FD66ECB0;
 Thu, 14 Nov 2019 16:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNi5dQQuc9xX4KcApQ8uNmN0LwMeJnBx+cS0BhQ9KnsGGIEe6ypdok+JelkNXZQO6ndTdcV1krS7pPb+l1VQXyK8Yfhv6knYVHiQKdCO4nLI2ZnEV7MHgxgmk/WEmeI7CJG7XC0/BNwCpAJwtY80hCPaCp9noWk6Bf7gWP5IYo/e1JLEN0Ibrj6OENw0SDEfV/TXBatSFm3KHHya2ztqmhIh9qqv7koEn7H2/Pxwrq4LVSzrrUQp65Ikf0xuZtyBW+WP0us4sU6d1qHY0LKLBxs/KaF1J3AVvEc779+1tMeWrTvW+wh9geOXHG/foxtZcWUZETSh+d4Zc79v8mUdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg5MKoT3zPlpzmbi59RtpMZe5mSxY/zcWcOFcOJ/2l8=;
 b=Vt0fInXWOhaxsiWEkJIq06MBAHtmitROrG1ppbj/Au/PwhXRtrtCXkJmNPoPXP8WTHI9NctDHNYJUl1DBkt8XTbVKspxICVvIqhPONP0XTlbeCYxI0KuoWTxblImlVju26Qj9MtyGZXXHY/deQQmaJ0FbRJ8P4NOJfStvdds6lUimo3G6hUKkCkD7HfTJ4gOnRvmvJu+P51rxLZ9ULSSxg94TyBfP6rg61CJP3gwDksvNisAuojIkECPDfCagCsF9xC1WOby1A6JGOhDf7HnAlfwqudTWrWbLcptrfYw6WyAsf0ZCYVMzaC/jHJN6cO3PUK5WEGik4MkcHGrLfOG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0181.namprd12.prod.outlook.com (10.172.79.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 14 Nov 2019 16:41:14 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195%5]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 16:41:13 +0000
Subject: Re: [PATCH 0/4] drm/amd/display: remove some set but not used
 variables
To: zhengbin <zhengbin13@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
From: Harry Wentland <hwentlan@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <e1bfa8cc-1552-9f81-3705-ef6b832461c8@amd.com>
Date: Thu, 14 Nov 2019 11:41:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::33) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c6349e6b-4256-4667-3784-08d76921763c
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0181:|CY4PR1201MB0181:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01812DCB58CA19A8EEFEBDF18C710@CY4PR1201MB0181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 02213C82F8
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(189003)(199004)(31696002)(47776003)(5660300002)(50466002)(186003)(14454004)(305945005)(7736002)(81156014)(31686004)(6512007)(2906002)(486006)(8676002)(66066001)(25786009)(6486002)(23676004)(65806001)(316002)(99286004)(11346002)(446003)(66946007)(66476007)(8936002)(66556008)(478600001)(229853002)(76176011)(230700001)(52116002)(65956001)(2486003)(386003)(6506007)(6436002)(2616005)(3846002)(4001150100001)(6116002)(26005)(81166006)(36756003)(4744005)(6246003)(58126008)(53546011)(476003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0181;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ScztVNHxPApA9hxrJiDDS7NPVJzE18909Oo5Qz3YDD3eIc9YqZ4MzLLgCSod46k858wFU7Ky18Lu2aWYNx4yz/Lz8bfq44s0yReF12Xutb1ovW6t5RGv6k7aJMM4p+W4GHlp5L1EhuxyLv5PxcbKnmX2HvwpBeFACKLXrHJXOZwwD7KhGHfSQER8Mz0+uERkbnDjb3MCHnqh2/74dzcTiQtNsYmeCR83iWtYE8RNEwq0NregHU+V3fAxTMlo86pQAcZeqgIORHYGykJl1QqgVFCsPetV4BpQPL6uCKMI8YFDvboyaZcMeJLFSPQ+Felf5/D6lfyFxXyssLLq2WAasMdstnulKjrXlVoN8NCxxNVgtOi76g2uazPCK6sossrA9UQzggokR+Pkoj1lPjlt7hD+57TQ6j4pFEhnT8m74hyUXGaGmaSIu5BVQtLjHSJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6349e6b-4256-4667-3784-08d76921763c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 16:41:13.9197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXpNoTIxG8JPLu3JDVsJQJ1ma6KS0JtzP0cnTxSCzyuIMXQvw45grCS0lmjCe+zoL8rA4judpaiv9c489buY8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0181
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg5MKoT3zPlpzmbi59RtpMZe5mSxY/zcWcOFcOJ/2l8=;
 b=eBke+crEqE7YdwWD5o1gZT0ZLiNsefICSKpefPvR5TWG6ORd9TBo7Y/X3Xs985UlY8SHJIQ6KDNJnqn/8CimJSYWq512BX8qcqw7NDKCLuDvW2cI7coWe1c+/PuYA5ZWFMVG84RHwn1Yig/U0t7EItLPvnomI7tNnalEWLbQB4A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0xNCA3OjM2IGEubS4sIHpoZW5nYmluIHdyb3RlOgo+IHpoZW5nYmluICg0KToK
PiAgIGRybS9hbWQvZGlzcGxheTogcmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGUgJ29s
ZF9wbGFuZV9jcnRjJwo+ICAgZHJtL2FtZC9kaXNwbGF5OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNl
ZCB2YXJpYWJsZSAnYnAnIGluCj4gICAgIGJpb3NfcGFyc2VyMi5jCj4gICBkcm0vYW1kL2Rpc3Bs
YXk6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdicCcgaW4KPiAgICAgYmlvc19w
YXJzZXIuYwo+ICAgZHJtL2FtZC9kaXNwbGF5OiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJp
YWJsZSAnbWluX2NvbnRlbnQnCj4gCgpUaGVzZSB3b3VsZCBiZSBmaW5lIGFzIGEgc2luZ2xlIHBh
dGNoIGFzIHdlbGwgYnV0IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZwpwcmVmZXJlbmNlIGVpdGhlciB3
YXkuCgpQYXRjaGVzIGFyZToKUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgoKSGFycnkKCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jICAgICAgIHwgMiAtLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIuYyAgICAgIHwgMiAtLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jIHwgMiAt
LQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+
IC0tCj4gMi43LjQKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
