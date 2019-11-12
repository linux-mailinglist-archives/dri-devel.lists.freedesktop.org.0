Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997A6F9A6E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 21:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4B76E520;
	Tue, 12 Nov 2019 20:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484AD6E520;
 Tue, 12 Nov 2019 20:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SufSrIHXmkh6XvWn91aWKEoTTvU8gZLH4ruk4Cpb/QXPovGTs+CnCGOT0RSKVgTYqmY8h4SIAB9B8Cq5Kzkn7PZKG9W9COukeGnPFuZzRd+rB3T/jHJwwqGidy2lTUYIrfw0SP09lrLdixaptY7JqnpY1X7cTmLYTGMP6qi1K79pEsWCKGdZWioMd0cJafHbIGAu3n4Fojc10oFu4BPZqnrITEjXIE4Go5kPFu+EHJ5LGUAJDAg8+CnSJK2D62QsPQi2fLeTowjyVfQ1Yg5auvxUYMLw/I7LCm/6CEJ4D3pMS5CkkLoBFDFzj/QvGMoo64nRYIFrkGRG/zrfCjU/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC4MwTw1dU7ywaoMKx76Ec0g4sMCpZ88y3qeJZweO6w=;
 b=De+zXYI1nAgGo9Bh5Iwz8AJp9QWE3xDbjs54tJhzuaQuiyMwWzRSvMUpmAzlONVYknBeZrYH2DghZ7WSEy7KfDo2yFs1UDzgJoCcmu+LfEKDlHCMGXLDsWtp2rHlkgJDedU6daxT23v67nWj7I0x5hIFbpUHhalcrkFDeYqeaCZeGgFiKR8Gck1LgIx3RjCVsXHjLKQxLg80Vjybq4vtY7ZHKPSUK4AZcwrR1tLhRnz36kVeyXThNAbEx+s1qdUmkm/WnhAy4COYp9ZJT/Jvxu3yQ3A+D6fgUe5ltt+XftDXstLCYq1vW1MZa3yE0IcRonMcYZU4K1XoIVk+1mPRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0216.namprd12.prod.outlook.com (10.172.76.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Tue, 12 Nov 2019 20:19:05 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195%5]) with mapi id 15.20.2451.023; Tue, 12 Nov 2019
 20:19:05 +0000
Subject: Re: [PATCH -next] drm/amd/display: Fix old-style declaration
To: Yuehaibing <yuehaibing@huawei.com>, Joe Perches <joe@perches.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Bhawanpreet.Lakha@amd.com, Jun.Lei@amd.com,
 David.Francis@amd.com, Dmytro.Laktyushkin@amd.com,
 nicholas.kazlauskas@amd.com, martin.leung@amd.com, Chris.Park@amd.com
References: <20191111122801.18584-1-yuehaibing@huawei.com>
 <01c630e6d4c58b3f6184603e158f53fb9aaeae7d.camel@perches.com>
 <3361b760-fe4f-87e8-b0a4-ebda390aa492@huawei.com>
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
Message-ID: <e59cbdf4-ac9e-dda7-f1c3-fdd148ddeeea@amd.com>
Date: Tue, 12 Nov 2019 15:19:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
In-Reply-To: <3361b760-fe4f-87e8-b0a4-ebda390aa492@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::26) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 39a3da19-50f4-4315-c552-08d767ad9097
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0216:|CY4PR1201MB0216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB021639A3B5399AC26F1A41A08C770@CY4PR1201MB0216.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 021975AE46
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(66556008)(81156014)(8676002)(66476007)(81166006)(8936002)(36756003)(99286004)(4001150100001)(110136005)(58126008)(316002)(5660300002)(52116002)(6666004)(31696002)(25786009)(14444005)(66946007)(6246003)(4326008)(6506007)(305945005)(53546011)(6512007)(23746002)(229853002)(230700001)(11346002)(50466002)(446003)(7736002)(26005)(3846002)(386003)(14454004)(478600001)(47776003)(31686004)(6636002)(6486002)(76176011)(2906002)(65806001)(65956001)(486006)(66066001)(2616005)(476003)(6116002)(6436002)(186003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0216;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6s6SqoUy3a0yh0ZO7+jOdEL8NFyHRJimhVSz31xXzEQu0mgn5vW346X/tE8LI2oe8gAgV2ATlWQGqJQKP7tK8DVfXUiHNlSEopyWu9Aw0YC/yjyiPge/0wZdDAfoKYNTfhW/s63K88uE1e7i4M+FFMo/Rwq9L/lagxgciReAjseAqEmZZSKpwBVNCCSEBLi6X7KRnpl4G59AeijH7HKE1Qs8yMQDOnc5lzTmo06j8//Zd6dHOl9d8ZksrMnV13oBWm0+9eKj/1g4H91bCOVXyudcLkS4JF8PWCJWcC28STYekUz8NOuEVAd1M+8PdPziz8kePI5CzaAh9dm+1aK71j1DdlPSVuEMMlcrEnYrvL6e6ZnIofFMn2XbgDMo3TkEZ/JfsGUR3/Fwl4cF8N3juVWw7oKvFAnGzrqnGH8I/VsP28FWAcBl0+nOkDeSMQmY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a3da19-50f4-4315-c552-08d767ad9097
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 20:19:05.1202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wvHVpGyrcfRGV9biyuUGoglhGBxkfj+EcrjBqYlFjVLLgMFrivn+vZD5w1aL6JdNx6mGOtpdjMSGbPt7L5mig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC4MwTw1dU7ywaoMKx76Ec0g4sMCpZ88y3qeJZweO6w=;
 b=gVTINuaE7Ncul+q3z68uMMM1rhuXu1YnvyVxS5dPPrS9XcNVnmXEsoX8lEsOqOoYtK9k7fC8IMe23GZUXeJz24TwMczGhgGqZp+lj9hMEk35R8YSrXUdUgNl7NkclaMyjGzLTvaPjbhCnsEv0Gnd7X2ld0SPMw39WFT8pJVbNuI=
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0xMiAyOjUxIGEubS4sIFl1ZWhhaWJpbmcgd3JvdGU6Cj4gT24gMjAxOS8xMS8x
MiAxMDozOSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4+IE9uIE1vbiwgMjAxOS0xMS0xMSBhdCAyMDoy
OCArMDgwMCwgWXVlSGFpYmluZyB3cm90ZToKPj4+IEZpeCBhIGJ1aWxkIHdhcm5pbmc6Cj4+Pgo+
Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9jb3JlL2RjLmM6NzU6
MToKPj4+ICB3YXJuaW5nOiAnc3RhdGljJyBpcyBub3QgYXQgYmVnaW5uaW5nIG9mIGRlY2xhcmF0
aW9uIFstV29sZC1zdHlsZS1kZWNsYXJhdGlvbl0KPj4gW10KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwo+PiBbXQo+Pj4gQEAgLTY5LDcgKzY5LDcgQEAKPj4+ICAj
ZGVmaW5lIERDX0xPR0dFUiBcCj4+PiAgCWRjLT5jdHgtPmxvZ2dlcgo+Pj4gIAo+Pj4gLWNvbnN0
IHN0YXRpYyBjaGFyIERDX0JVSUxEX0lEW10gPSAicHJvZHVjdGlvbi1idWlsZCI7Cj4+PiArc3Rh
dGljIGNvbnN0IGNoYXIgRENfQlVJTERfSURbXSA9ICJwcm9kdWN0aW9uLWJ1aWxkIjsKPj4KPj4g
RENfQlVJTERfSUQgaXMgdXNlZCBleGFjdGx5IG9uY2UuCj4+IE1heWJlIGp1c3QgdXNlIGl0IGRp
cmVjdGx5IGFuZCByZW1vdmUgRENfQlVJTERfSUQgaW5zdGVhZD8KPiAKPiBjb21taXQgYmU2MWRm
NTc0MjU2YWU4YzBkYmQ0NWFjMTQ4Y2E3MjYwYTA0ODNjMAo+IEF1dGhvcjogSnVuIExlaSA8SnVu
LkxlaUBhbWQuY29tPgo+IERhdGU6ICAgVGh1IFNlcCAxMyAwOTozMjoyNiAyMDE4IC0wNDAwCj4g
Cj4gICAgIGRybS9hbWQvZGlzcGxheTogQWRkIERDIGJ1aWxkX2lkIHRvIGRldGVybWluZSBidWls
ZCB0eXBlCj4gCj4gICAgIFt3aHldCj4gICAgIFNvbWV0aW1lcyB0aGVyZSBhcmUgaW5kaWNhdGlv
bnMgdGhhdCB0aGUgaW5jb3JyZWN0IGRyaXZlciBpcyBiZWluZwo+ICAgICBsb2FkZWQgaW4gYXV0
b21hdGVkIHRlc3RzLiBUaGlzIGNoYW5nZSBhZGRzIHRoZSBhYmlsaXR5IGZvciBidWlsZHMgdG8K
PiAgICAgYmUgdGFnZ2VkIHdpdGggYSBzdHJpbmcsIGFuZCBwaWNrZWQgdXAgYnkgdGhlIHRlc3Qg
aW5mcmFzdHJ1Y3R1cmUuCj4gCj4gICAgIFtob3ddCj4gICAgIGRjLmMgd2lsbCBhbGxvY2F0ZSBj
b25zdCBmb3IgYnVpbGQgaWQsIHdoaWNoIGlzIGluaXQtZWQgd2l0aCBkZWZhdWx0Cj4gICAgIHZh
bHVlLCBpbmRpY2F0aW5nIHByb2R1Y3Rpb24gYnVpbGQuIEZvciB0ZXN0IGJ1aWxkcywgYnVpbGQg
c2VydmVyIHdpbGwKPiAgICAgZmluZC9yZXBsYWNlIHRoaXMgdmFsdWUuIFRoZSB0ZXN0IG1hY2hp
bmUgd2lsbCB0aGVuIHZlcmlmeSB0aGlzIHZhbHVlLgo+IAo+IEl0IHNlZW1zIERDX0JVSUxEX0lE
IGlzIHVzZWQgYnkgdGhlIGJ1aWxkIHNlcnZlciwgc28gbWF5YmUgd2Ugc2hvdWxkIGtlZXAgaXQu
CgpUaGFua3MsIEhhaWJpbmcuIFllcywgd2UnbGwgd2FudCB0byBrZWVwIGl0IGZvciBidWlsZCBw
dXJwb3Nlcy4KCkhhcnJ5Cgo+IAo+Pgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjLmMgfCA0ICstLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jCj4+IGluZGV4IDFmZGJhMTMuLjgwM2RjMTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwo+PiBAQCAtNjksOCArNjksNiBAQAo+PiAgI2Rl
ZmluZSBEQ19MT0dHRVIgXAo+PiAgCWRjLT5jdHgtPmxvZ2dlcgo+PiAgCj4+IC1jb25zdCBzdGF0
aWMgY2hhciBEQ19CVUlMRF9JRFtdID0gInByb2R1Y3Rpb24tYnVpbGQiOwo+PiAtCj4+ICAvKioK
Pj4gICAqIERPQzogT3ZlcnZpZXcKPj4gICAqCj4+IEBAIC04MTUsNyArODEzLDcgQEAgc3RydWN0
IGRjICpkY19jcmVhdGUoY29uc3Qgc3RydWN0IGRjX2luaXRfZGF0YSAqaW5pdF9wYXJhbXMpCj4+
ICAJaWYgKGRjLT5yZXNfcG9vbC0+ZG1jdSAhPSBOVUxMKQo+PiAgCQlkYy0+dmVyc2lvbnMuZG1j
dV92ZXJzaW9uID0gZGMtPnJlc19wb29sLT5kbWN1LT5kbWN1X3ZlcnNpb247Cj4+ICAKPj4gLQlk
Yy0+YnVpbGRfaWQgPSBEQ19CVUlMRF9JRDsKPj4gKwlkYy0+YnVpbGRfaWQgPSAicHJvZHVjdGlv
bi1idWlsZCI7Cj4+ICAKPj4gIAlEQ19MT0dfREMoIkRpc3BsYXkgQ29yZSBpbml0aWFsaXplZFxu
Iik7Cj4+ICAKPj4KPj4KPj4KPj4gLgo+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
