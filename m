Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CCC108FEA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 15:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C1D89EB1;
	Mon, 25 Nov 2019 14:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6B489EAC;
 Mon, 25 Nov 2019 14:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnzM/zopAqpcHzejEnDSgHyyH+kvO9dgBAMf0P6JQ3u6lQeORmdm36eu4pFvCV35pgSNMaHhtknFFtkqQ7B+zIioq/e5uMZwj5cCaMX891I7BQehi5PyjeQUCi/1wzwnS5vPx6RxRaRbcvml/bzMjb3YUGvkUc+krd/rOgCgOtcD+M/xM+7wnw6spDGXv07P3MniQepi+4pw9wYEsemJVTZKQxjIAQI9RZsC3bzcgii/sNwUM1O92diOTVIt7/d2vIB/Jmr4fbCpssVNHMEfsdO00fjcnBgbepkzUhW7Wjl6LdU2VFNoer6oixVCImEAnBeV1FWzp3esNmWjx773Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/9fIBsdcQIb1DfTBD7Su2uYmYkjizqLQdD0liADHo8=;
 b=jQgbsTfM+92Fm81L89sZwU9mm5FUFhv4spl6XlxLXcnVJgfiYdNcUhwNiytJhm8oogG6wSRLzwVdL6n5spjEYDa/Co6bf1zstKTxkgrDZ1pjL8fAQEP3cjA4D1LqP88i+gXfPJRgXgIoSA50Xhzbp0Q7/tXAMqUuCKybiiOPrmjQxVZjFjEnGUUiP00nLJaJKXmSrqMcEiLHxVmdf/MiXCJuFo7rawf2gmku7tlb6cyjUZORslx9MwtzrpaS/+HqpIZmUjwgBcXWv61Vs5kQo9qiYPCxq+gx421MM36f7KR/ZB8yABiSzKyp+aV/RMUEX/CukIPgzhOrshEEHFIq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0118.namprd12.prod.outlook.com (10.174.52.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Mon, 25 Nov 2019 14:28:07 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195%5]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 14:28:07 +0000
Subject: Re: [PATCH] drm/amd/display: Use NULL for pointer assignment in
 copy_stream_update_to_stream
To: Nathan Chancellor <natechancellor@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
References: <20191123193639.55297-1-natechancellor@gmail.com>
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
Message-ID: <ec7313da-dcdd-8884-063f-bf0e8cc664dd@amd.com>
Date: Mon, 25 Nov 2019 09:28:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191123193639.55297-1-natechancellor@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 434245ba-d9e0-4f36-6479-08d771b3b074
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0118:|CY4PR1201MB0118:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0118BCF64B4EACBC96DCA2918C4A0@CY4PR1201MB0118.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0232B30BBC
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(199004)(189003)(54906003)(186003)(14454004)(966005)(5660300002)(2906002)(26005)(3846002)(6116002)(6246003)(14444005)(4001150100001)(31696002)(81166006)(81156014)(25786009)(8936002)(8676002)(4326008)(2486003)(76176011)(6486002)(229853002)(6306002)(6512007)(6436002)(50466002)(478600001)(45080400002)(52116002)(23676004)(66476007)(66556008)(6506007)(99286004)(66946007)(11346002)(47776003)(65806001)(65956001)(66066001)(386003)(53546011)(6636002)(230700001)(446003)(58126008)(2616005)(305945005)(316002)(110136005)(7736002)(36756003)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0118;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qCnTFU5iV162tXqcgbiCw4TSxpZXhiR1U5Yz7V8nw+687gMol824bceGnIvGzjraNgWrphv/6TqA1NPXnwP59rSRtLdjyf+ZKkYFMGFOaBvjjvg1cl6lBNwBZ1Xfszh4iqgePHAlq5jvvAcUjXTkXkulH2iTdEQ2MzzEilpvoy95Yx83st1jq8f6PwGxRdf+54MX9KfCzxZGh19vTuIIoJ2FvHslKUlykcVL2yGQc3LRNJmorfz/CSscxEaSnTE6W15M2w1+xwTwjBUdfadVmDjEEnssT2xnyR/rI3KezytPETJdogEaZkrxWVdEeKHi0j6Us+iuBcboqRu+4bdnoPeF+yXrqfmv8DOclObU7xS6s9owrER/cvZYQchdIBLKnKZ2SZmZi3SipvkFGBe3DRCB3OQU+SvoQ4Uvvylqc1NSpVV4SUP2oEIQlasMjRg2T3kgJM5+/dbKw5wsO8zno1SSvbtbjJo6jMwj08HBYl8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434245ba-d9e0-4f36-6479-08d771b3b074
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 14:28:07.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DVCLHNsHTkE0yVC6wS3Yxmqh2egWz0lCMotbreHlZfSxhD1Y38yqlXORjCTeX1nECdfYBkA5jAgG2vPKmWfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/9fIBsdcQIb1DfTBD7Su2uYmYkjizqLQdD0liADHo8=;
 b=fpZe+7+PObgrfwBNpPmTyxKbpTSoOnHzdLPQygTDvglIiNi1/8IK72CaZzpqGAksVNPCoNkjpz11Mja5UQl6DCW9sxYaR27sTRn09eWCQQn/BI65qLdSug1WfV95KO0D7MYYh6oiTLFV1rXM70Sgsg2U+hGf09fPwuXruXXXEZw=
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 clang-built-linux@googlegroups.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0yMyAyOjM2IHAubS4sIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IENsYW5n
IHdhcm5zOgo+IAo+IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jOjE5NjU6MjY6IHdhcm5pbmc6Cj4gZXhwcmVzc2lvbiB3aGljaCBldmFsdWF0ZXMg
dG8gemVybyB0cmVhdGVkIGFzIGEgbnVsbCBwb2ludGVyIGNvbnN0YW50IG9mCj4gdHlwZSAnc3Ry
dWN0IGRjX2RzY19jb25maWcgKicgWy1Xbm9uLWxpdGVyYWwtbnVsbC1jb252ZXJzaW9uXQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBkYXRlLT5kc2NfY29uZmlnID0gZmFsc2U7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fgo+IC4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9k
Yy5jOjE5NzE6MjU6IHdhcm5pbmc6Cj4gZXhwcmVzc2lvbiB3aGljaCBldmFsdWF0ZXMgdG8gemVy
byB0cmVhdGVkIGFzIGEgbnVsbCBwb2ludGVyIGNvbnN0YW50IG9mCj4gdHlwZSAnc3RydWN0IGRj
X2RzY19jb25maWcgKicgWy1Xbm9uLWxpdGVyYWwtbnVsbC1jb252ZXJzaW9uXQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHVwZGF0ZS0+ZHNjX2NvbmZpZyA9IGZhbHNlOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+Cj4gMiB3YXJuaW5ncyBnZW5l
cmF0ZWQuCj4gCj4gRml4ZXM6IGY2ZmU0MDUzYjkxZiAoImRybS9hbWQvZGlzcGxheTogVXNlIGEg
dGVtcG9yYXJ5IGNvcHkgb2YgdGhlIGN1cnJlbnQgc3RhdGUgd2hlbiB1cGRhdGluZyBEU0MgY29u
ZmlnIikKPiBMaW5rOiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGQ2xhbmdCdWlsdExpbnV4JTJGbGlu
dXglMkZpc3N1ZXMlMkY3NzcmYW1wO2RhdGE9MDIlN0MwMSU3Q2hhcnJ5LndlbnRsYW5kJTQwYW1k
LmNvbSU3Q2ViNWU1NTgxMzMwNzQ1NmNmN2Q2MDhkNzcwNGM3OWM0JTdDM2RkODk2MWZlNDg4NGU2
MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMSU3QzYzNzEwMTM0NjA4MDI5NjQwOSZhbXA7c2RhdGE9
NkhLM3dXWU1vSUxiaUJpc2pvSGtGd29wViUyQnVKWVVoOHdDRGhNU3ZSUVE4JTNEJmFtcDtyZXNl
cnZlZD0wCj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9y
QGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRA
YW1kLmNvbT4KCkhhcnJ5Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5j
Cj4gaW5kZXggYzdkYjRmNDgxMGM2Li4yNjQ1ZDIwZThjNGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKPiBAQCAtMTk2MiwxMyArMTk2MiwxMyBAQCBzdGF0
aWMgdm9pZCBjb3B5X3N0cmVhbV91cGRhdGVfdG9fc3RyZWFtKHN0cnVjdCBkYyAqZGMsCj4gIAkJ
CWlmICghZGMtPnJlc19wb29sLT5mdW5jcy0+dmFsaWRhdGVfYmFuZHdpZHRoKGRjLCBkc2NfdmFs
aWRhdGVfY29udGV4dCwgdHJ1ZSkpIHsKPiAgCQkJCXN0cmVhbS0+dGltaW5nLmRzY19jZmcgPSBv
bGRfZHNjX2NmZzsKPiAgCQkJCXN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQyA9IG9sZF9kc2NfZW5h
YmxlZDsKPiAtCQkJCXVwZGF0ZS0+ZHNjX2NvbmZpZyA9IGZhbHNlOwo+ICsJCQkJdXBkYXRlLT5k
c2NfY29uZmlnID0gTlVMTDsKPiAgCQkJfQo+ICAKPiAgCQkJZGNfcmVsZWFzZV9zdGF0ZShkc2Nf
dmFsaWRhdGVfY29udGV4dCk7Cj4gIAkJfSBlbHNlIHsKPiAgCQkJRENfRVJST1IoIkZhaWxlZCB0
byBhbGxvY2F0ZSBuZXcgdmFsaWRhdGUgY29udGV4dCBmb3IgRFNDIGNoYW5nZVxuIik7Cj4gLQkJ
CXVwZGF0ZS0+ZHNjX2NvbmZpZyA9IGZhbHNlOwo+ICsJCQl1cGRhdGUtPmRzY19jb25maWcgPSBO
VUxMOwo+ICAJCX0KPiAgCX0KPiAgfQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
