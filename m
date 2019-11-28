Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425A10CA9E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 15:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1736E837;
	Thu, 28 Nov 2019 14:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8189C6E835;
 Thu, 28 Nov 2019 14:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lzz8mGM6HYlz9BFav9U8l11dSLkPDhIS2RS97PnvgAXokaIxAZTK1CKLDakZpHCM6T8FNxypnf6Li4TzgKKlxvvVXnZdqEBGLy6zNfoLYYR+RGqNABuG6PVzknZb7G0s/aB7T2VVkiRgoRtaZde6Ir/RTFeg6XQua32El/AGaXGlDdad7nO8BxZjij+YhqMLJgzgySAKX2AjarXouY7301ndjCUZzCwSPHJr5j/zftEdPfCGBUJmu8nlwKV0THxtSmhS1wmmZmDSSpz7MoaEdErrVNN4kGWaxZfzFS4S+ttq4GoG6RdCfrQM9cN4+6PNrIj4NzNN73bF4uNNmKsCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zidlb+UgpTWs1KAHAIYtFMxiulWsR5fOu537JxnQvoE=;
 b=AULUkICKZsB2UogRGiy1qKCStwe3ia2tTP6B+iowVSpaJrwwOQsuR1GCnv/utGPFuGgWAikUnd+zD5mHxgoj2BB8dppCm8+A1bSCQgzq6TXTsRPUpgWp1jY3SthhIfguLAzPpjIsYwjzeAPjslLC0tNXrYHCqmEO6hBtYcOczuNwW8ynApCbGPRVwSor4ANFm13oqzXtfhHr4SXVIMF7XsJJLxiNG/2bjEGRko3yW3+0dUZdpR8Kw/D1MeOPhBnHUPyj6AHry0l9b6xOEFCaHpEMYNMnTOLF0ghIhUaK4bC4+HDrB6O2EXwRzjsziw1ixXjN+MrR2dt28gMtZNwGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0165.namprd12.prod.outlook.com (10.172.78.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Thu, 28 Nov 2019 14:46:15 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::1cdc:d782:cce:6d2b]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::1cdc:d782:cce:6d2b%9]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 14:46:15 +0000
Subject: Re: [PATCH 0/4] drm/amd/display: Remove unneeded semicolon
To: zhengbin <zhengbin13@huawei.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1574908300-126787-1-git-send-email-zhengbin13@huawei.com>
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
Message-ID: <d007a0ff-6298-93d0-7af2-289582927332@amd.com>
Date: Thu, 28 Nov 2019 09:46:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <1574908300-126787-1-git-send-email-zhengbin13@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a458e131-bdb3-466d-8c69-08d77411b806
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0165:|CY4PR1201MB0165:|CY4PR1201MB0165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB016559D8C9449F1628D16F288C470@CY4PR1201MB0165.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0235CBE7D0
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(23676004)(2616005)(446003)(11346002)(7736002)(305945005)(6666004)(58126008)(6486002)(230700001)(6436002)(478600001)(14454004)(31696002)(229853002)(25786009)(2486003)(76176011)(66066001)(65956001)(65806001)(186003)(26005)(4744005)(81166006)(386003)(81156014)(50466002)(316002)(53546011)(6506007)(52116002)(6512007)(6246003)(8936002)(36756003)(5660300002)(8676002)(31686004)(99286004)(6116002)(47776003)(3846002)(2906002)(4001150100001)(66556008)(66476007)(66946007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0165;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gNxrOSNkpRgbg2LgzsqvobqtMrRJWSH0PX1EmgahQT0Kxz6jxnTKlvEe0cNCXO0iY3AXNfxQzmbMgcSCHFavxDa1VzCIYcCSegDg6lE7BN2jfXh+qKUAUBqzZVWSFZYfzvlGm5gnvXbah38hzJP7WHGZskgtCyqy8vX7dETkYY9TL0oD3QPTMbaOL5qVvv/7adagV7sYCTJfkaV/JoGLNRhRkzYTtHOtQt+E0ODAmWs6kFvnn1tijcpBq2zLHfw6w2EDtFj0H7E9FpixqIj5sVahh6U4Xy9c/opGJMcXnf/C8lESsuvsuvQrWriqk1U3NUF5b9R/SnjLQsnyDdNmnvJzfK1eMF6wdAZiR/w9Ro6I0cEsbRB4xgXsMziKRYu4LCxPJb6UuShZZKd101YfQnXwCpBUYNZWpv/u/MJqbhTK6LODIuRpNGLwmKVROTS+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a458e131-bdb3-466d-8c69-08d77411b806
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 14:46:15.2974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQbgO1udqrVrB4r8xJf5xKqqrlb7KIXWvzBHSwoZ+AotB+OI7G+ULR/2FfpNSmNOVAeQqjxKMM1z04peymKuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0165
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zidlb+UgpTWs1KAHAIYtFMxiulWsR5fOu537JxnQvoE=;
 b=YhO/baB7dI2SG+yr35VoBjXltu5K+Hz7PG8OjDucF03rOgqlMe4dMzC9lTRgd6znd9aGh2bq19CjNjYoNLSinFFM7lAMOLAqtlZ9Xvp3RkA2n+Ej4EAMHRZXeAYvoalZAoWTXdmpCETgNljEuwv9UYfge+ny1IXvj0Q1jnhOK5o=
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

U2VyaWVzIGlzClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KCkhhcnJ5CgpPbiAyMDE5LTExLTI3IDk6MzEgcC5tLiwgemhlbmdiaW4gd3JvdGU6Cj4g
emhlbmdiaW4gKDQpOgo+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgdW5uZWVkZWQgc2VtaWNv
bG9uIGluIGJpb3NfcGFyc2VyLmMKPiAgIGRybS9hbWQvZGlzcGxheTogUmVtb3ZlIHVubmVlZGVk
IHNlbWljb2xvbiBpbiBiaW9zX3BhcnNlcjIuYwo+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUg
dW5uZWVkZWQgc2VtaWNvbG9uIGluIGhkY3AuYwo+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUg
dW5uZWVkZWQgc2VtaWNvbG9uIGluIGRpc3BsYXlfcnFfZGxnX2NhbGNfMjEuYwo+IAo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlci5jICAgICAgICAgICAg
ICAgICB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19w
YXJzZXIyLmMgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kbWwvZGNuMjEvZGlzcGxheV9ycV9kbGdfY2FsY18yMS5jIHwgNCArKy0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5jICAgICAgICAgICAg
ICAgICAgIHwgMiArLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiAKPiAtLQo+IDIuNy40Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
