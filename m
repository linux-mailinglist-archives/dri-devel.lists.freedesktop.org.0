Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FFB1B2927
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01626E128;
	Tue, 21 Apr 2020 14:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA876E0FA;
 Tue, 21 Apr 2020 14:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLn+pGC0dIUWCawZ4KF6N/gKnc2XgWNrkB8FFrtKJoCctheqUplqhiCaPJQAItCvzU2cFYJKKpMI+6shF0XH7oBqCcYP/P3t63JsyXCxxRmmfP5bsNOXkjnao+FmKOD1SavpKmy01q0B4AiKU0yXqJeSTefuAhwPc1VX9pc3TWbYcj5Lq4xGQ6j/fyGak1kIpfjEqGH3+f+qY1SGiDNFuMSSH1sL16+mqvKn/OLI/sSePMSKkWdgvKD7sYp219rggvg+J+KJfLffLCo/xhHDQg6rYBPxmv1cz45ehq6OLuIVxIes99ARRi/Z2jwOhoV0aDTXDF31jvhp5BdidBngQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFOn4OZ2J8xVrWXKi8Ajlav00HH6XbticLiAp29FsCU=;
 b=IEkUzAMbha5uYgS+sgdA3iDS7Gi7np55q/6sBokGbJ/QBfI8mb4LEgsl3uYlpUe6kknJYP+Tkb6knhyX8B4er3bxx7RBnkKsd1W6ybR3KPDY/eViOXwL+wbC5CClocpGYqmP3liJwYrKxhTPTGM1NE0S9AKxmIdDjSZqDAk67rfxhi1roHuIrnBXU/sHzwlUk4jJuWoJUqPPUNDUyLkEibDvEwjYWg4By5CcayjgZCsGrmXSjSwyKzicyrgRWuC+Uj0tiKbBXwkGw1BIaPtEjzabMimQJGvlXxnB1u21NiDapkZUeZE9RndbWhxugeJq3w3f4HyWyb01zH94eMVvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFOn4OZ2J8xVrWXKi8Ajlav00HH6XbticLiAp29FsCU=;
 b=SnC9O2u0hlSFu9AruT7CK8Z5nmTfFUffdUYiDJcfokwcoOCOtgvtidUBSmTiepIR57jHaYT6ail9JMTaB5sGvYBJ9TRlZuhTPB1TBhdFxdRkTlpZIPyAn5QhaqEvQQNfF7cfag7eecslZnn1EvE136efVtvFDAg1R9YuyhQwF8U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4537.namprd12.prod.outlook.com (2603:10b6:303:5b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 14:13:10 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::31b7:9b4e:3f37:5e97%6]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 14:13:10 +0000
Subject: Re: [PATCH] drm: amdgpu: fix kernel-doc struct warning
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20200420015015.27991-1-rdunlap@infradead.org>
 <20200420015015.27991-2-rdunlap@infradead.org>
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
Message-ID: <769d317c-e838-a218-c434-6c011fd1a730@amd.com>
Date: Tue, 21 Apr 2020 10:13:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200420015015.27991-2-rdunlap@infradead.org>
Content-Language: en-US
X-ClientProxiedBy: BN3PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:400:4::34) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:9240:c66::6] (2607:fea8:9240:c66::6) by
 BN3PR03CA0116.namprd03.prod.outlook.com (2603:10b6:400:4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Tue, 21 Apr 2020 14:13:07 +0000
X-Originating-IP: [2607:fea8:9240:c66::6]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 885ceff8-d6e1-45e8-6f97-08d7e5fe1eb2
X-MS-TrafficTypeDiagnostic: MW3PR12MB4537:|MW3PR12MB4537:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4537286098220DEB1A2214BA8CD50@MW3PR12MB4537.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(36756003)(8936002)(2906002)(66946007)(66476007)(66556008)(316002)(6486002)(31696002)(53546011)(66574012)(5660300002)(478600001)(4326008)(6666004)(2616005)(8676002)(81156014)(52116002)(186003)(54906003)(16526019)(31686004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /B21CcjG98FVjkTK4p9627b7QDzCN7cI1FUGaNwjUgWqKfpWZHkaXQ8cLbVvgkcV+foxvUSR0a7zIxor4xOAs4f+PhLyvA1T6duQ8+oUEmrJEF9pmQLHeLv7DyNGCwYVqoG+GzTnLju94UZZjid4QiWYGKaPIdGhb5IFLxaQ7bJzaSrOOIQ1nhsrw0kq210wkXEqWc+9SPH9JuIetrlJinPi2HKbU6nhGWI3xsrCfGWJr8OCIqbEscOJZJECmz8IlF1Md4bx0MyNVGAJo+hdVu3K75yR1/AqguHAwacREcCQriAUQjulVRX3yllKzuNSOZU6r7CrjqkL8wQ75Ft4Ya7Cy0If5C8ScOj8j4h9uqhKgREcGWS3iZQFNeAwEodFS48RBXLWLOU0Yp4YYs+mtaljJiMJF68kpZygdqUB58T8b3pKm0sSudZSe3e6nnkx
X-MS-Exchange-AntiSpam-MessageData: zbHFQKvRDhb7iNmT9gmBwf95Iuv1uvDDreX/NU/XRnGz7TSUx4EdeDmhccr3y72eqtnyxsjCH7NzLrecEoqyHZg54P51n/ZtGCe068Sq2a7/mefrJg+N9OQJWe5jhm2DmGXuNocni0S6k0t16+UCTx2mLWiMF8/B8kPJyx4qwBY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885ceff8-d6e1-45e8-6f97-08d7e5fe1eb2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 14:13:10.2956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T6wu798j0HAopOpv9rsKogQ6lg27yg1jOPolrQ96KXfn9DuZAyTuSyVpK0jT2FGc+ulQNeEwDVotSCWbNpfQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4537
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
Cc: "Signed-off-by : Alex Sierra" <alex.sierra@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNC0xOSA5OjUwIHAubS4sIFJhbmR5IER1bmxhcCB3cm90ZToKPiBGaXggYSBrZXJu
ZWwtZG9jIHdhcm5pbmcgb2YgbWlzc2luZyBzdHJ1Y3QgZmllbGQgZGVzcmlwdGlvbjoKPiAKPiAu
Li9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYzo5Mjogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAndm0nIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV92
bV9ldmljdGlvbl9sb2NrJwo+IAo+IEZpeGVzOiBhMjY5ZTQ0OTg5ZjMgKCJkcm0vYW1kZ3B1OiBB
dm9pZCByZWNsYWltIGZzIHdoaWxlIGV2aWN0aW9uIGxvY2siKQo+IFNpZ25lZC1vZmYtYnk6IFJh
bmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IENjOiBTaWduZWQtb2ZmLWJ5OiBB
bGV4IFNpZXJyYSA8YWxleC5zaWVycmFAYW1kLmNvbT4KPiBDYzogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgo+IENjOiBEYXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91QGFtZC5jb20+Cj4g
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgoKUmV2aWV3ZWQtYnk6IEhhcnJ5IFdl
bnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgoKSGFycnkKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgICAgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiAtLS0gbG54LTU3LXJjMi5vcmln
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gKysrIGxueC01Ny1yYzIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBAQCAtODIsNyArODIsNyBA
QCBzdHJ1Y3QgYW1kZ3B1X3BydF9jYiB7Cj4gIAlzdHJ1Y3QgZG1hX2ZlbmNlX2NiIGNiOwo+ICB9
Owo+ICAKPiAtLyoqCj4gKy8qCj4gICAqIHZtIGV2aWN0aW9uX2xvY2sgY2FuIGJlIHRha2VuIGlu
IE1NVSBub3RpZmllcnMuIE1ha2Ugc3VyZSBubyByZWNsYWltLUZTCj4gICAqIGhhcHBlbnMgd2hp
bGUgaG9sZGluZyB0aGlzIGxvY2sgYW55d2hlcmUgdG8gcHJldmVudCBkZWFkbG9ja3Mgd2hlbgo+
ICAgKiBhbiBNTVUgbm90aWZpZXIgcnVucyBpbiByZWNsYWltLUZTIGNvbnRleHQuCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
