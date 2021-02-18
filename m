Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D247531F2D1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 00:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E2C6EA6B;
	Thu, 18 Feb 2021 23:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BB66E88C;
 Thu, 18 Feb 2021 23:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYYvUsxYwQzq2QzYDvrg5DWQsqfgP6g/bhpGSq00za+8Tjgu9T7mud7fF/7VTobC3VkDKrRLzuR+xkYaOZtJK1I/hJq/rzm4Aeyk777LFmYYn3JXwrZu/usudOmVwpu81tFUQ303JidCRemv5AZloJCRdVF4LiSzd5M0z6XMFqRcgDa9s1AdZmJ6+LE91tA9l5Wq/GP7LDw1gHDKD63VjCMFNVrfuMZH78EdnHcJtzE19mgp2lNmza0ZJKGI23DURZSExjUEcjcKVUIMEVl4378YotL2OmpVj0QcKOeuU3a9DDuAEHOj1+ZokMJPBGVjHDv1XcORK7Z5b6lY7CaMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wU2m5o1ywvoNW73am5AcPi/RC4gBpJxmwAf07oLheA=;
 b=UyukgOllkpvM91LLcfrgus53ZK71TjgIXhYp4Gwu4aPYdfic6vWXvzlcSGsgSoEUe0PvalMaw+1HysntYqBE1/nt1cE11J4l5XVRgRFUtui/LECwn/nNnBI+x4wG1MC+/aqGhkH08HxaVdAaere4NnSv8UzI54R0e8HLGsbmyBCZy9bi/9vFJFgoedz8FcdUfBak6MqLbRYHMxd3XHa/euCvfHqQm6MYATeHM6FrPgU4RXOVQXVUjjW+N5JiTqpyQ4wUPxVYk06NQ62wqiw9yPwuwXZ33CApruiGrNf590NWUZVrnsEykGBWNcpM5K94MN1wAtdxhq7/dEaoAb/5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wU2m5o1ywvoNW73am5AcPi/RC4gBpJxmwAf07oLheA=;
 b=wo9F02Z8W0RX2WZTWWHP7Fd5hRnvg7+RXVq8RQ0uej4YCZ72IyNqEd28q+0TGOHa2I32W2Vj1ieSklvC0Ua8uHzgHrnarex0tm9peqM44u2fGDJjLB8y+qS123YRWeVfG/KwzEE0lYAcL7AhOIyeryRp3HhQNv9CSwXlIEd0DQ8=
Received: from MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32)
 by MN2PR12MB3101.namprd12.prod.outlook.com (2603:10b6:208:c4::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 18 Feb
 2021 23:12:02 +0000
Received: from MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::49f7:4979:3a0a:4554]) by MN2PR12MB3022.namprd12.prod.outlook.com
 ([fe80::49f7:4979:3a0a:4554%6]) with mapi id 15.20.3868.027; Thu, 18 Feb 2021
 23:12:02 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/amd/pm/swsmu: Avoid using structure_size
 uninitialized in smu_cmn_init_soft_gpu_metrics
Thread-Topic: [PATCH] drm/amd/pm/swsmu: Avoid using structure_size
 uninitialized in smu_cmn_init_soft_gpu_metrics
Thread-Index: AQHXBkhFDJucxY3wQEGNwt0cVYduT6peil0M
Date: Thu, 18 Feb 2021 23:12:02 +0000
Message-ID: <DE2DF569-7545-41C2-AF18-400D6BD73215@amd.com>
References: <20210218224849.5591-1-nathan@kernel.org>
In-Reply-To: <20210218224849.5591-1-nathan@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [112.65.12.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7dc278be-6896-49db-c89f-08d8d46299b0
x-ms-traffictypediagnostic: MN2PR12MB3101:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB310134F44EE134F3A839E8BFA2859@MN2PR12MB3101.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZVADYGbdWeTHtk5Y/UfVTByS7K2ADI8vKISIr/VLNGKpMcTitrGucktdsnYdl6g6jTxGfGe4r/dZK0ZPLCQOflTvx9plVuMwCSjrbDv1sMXnWgXmYQ8NNA85mlpkLW5kuR9Oqjl9HHsMPzw0wU5OeIgkbBZI0HwjJvF0jyCK55CvnUPp+ApLnL1KzOWCOv74D+ucGBaX4bb571M/zAx7K+UM1toSQF66qJQZuI1B3ekE6TAFE/gMWwee9kC4hDjXfo5hCD6cOlWTs8D/zGPCB+e31FKu8B1SH6Ow5ApKV4vNa1nuu9ZleAZ3iVK1nbiTZGbDO4J0oIi71DaGsz4vEtwXohd8ho95YoP+M0oBTl7QBuyRZk5ukDhcMO+PiHNEuZj4dnx/ch/CnAAchW8JoLlVp7V1ioJEuxo4y9azPlJ+PkWXPU4ypp9NGG86hBNPxFLJuhT7zglYYUnJ1mkjl97yAhyJNgo+yNbCB093mK6HaZRJfJ1pVEAoKHLGLKMQ7VQhnRrtINR/5tuvdkY1cZi2OSYJfHRFeTuIlJqU8MW9J3deT2q8/Xva7sMTvaAWvUzBbNkBpSs2IqmvTirYXLYrFBmYwJCLP6Gm6RxS/PtWIYDoctxk8tV78D2iNbOwLAMQAG1gE9HG7oL7cULSv9IQM8S3mZ8XpksvvRPiHs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3022.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(64756008)(66556008)(66446008)(66946007)(966005)(186003)(66476007)(2906002)(83380400001)(6916009)(54906003)(6512007)(76116006)(91956017)(478600001)(8676002)(26005)(33656002)(36756003)(6486002)(5660300002)(8936002)(2616005)(4326008)(86362001)(71200400001)(316002)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aDR0RFE0MHBSbUJlUlhKY1dTRlNabEdveGk2QzM0czF6YUJrM253L3ZDZzU2?=
 =?utf-8?B?Q0NvUnNQOGp0bmc3ak1OMG9pQ0lGNGZNWFJnZW1tZCswZG5jRTBWNUY1L2hu?=
 =?utf-8?B?SE12SWs4MHBPZXNwVWllbG8zUDJqVUNsZHpydWdidkE5NnRDaW5LczdGWFU2?=
 =?utf-8?B?eFRvMTJleFpVbUppaUVMdm9iR3cramprMmUxc3h3d0hLZDc4RlRKdXdwaFdu?=
 =?utf-8?B?OFM3UmZ6dlVQcm1LL2tQZjFzRlpZNXUxeHdxV0ZWcExTUDBPSVJjSklsc3Nw?=
 =?utf-8?B?RUt4S0VoajJlTEpnSHprMHJWdDBpU2RiOU02LzJXeHJGbDhlQnREbERMZG5F?=
 =?utf-8?B?OUQrM3ovdExyVVFXZ2RPekhqN3g1c3VXa0NMZmV5NVdxZUt6ZS94bC9Md0ZH?=
 =?utf-8?B?SG1TTHFQM3dNZzFKd1J5Z01Qc2QwZFpFN1dXbzNFcjJmYWNpM3d3OFN0VVdK?=
 =?utf-8?B?aURvdlVHTmZTQnl3RXAvVFAxRDljRm5hSlV1YUZpTllheGd3R0ltZFZURlll?=
 =?utf-8?B?ckNPNFNBL2hDTnVKaUc3eCtlOFQ0TmVkc2U2STFsUTNFZnpkamJBckE1aGQx?=
 =?utf-8?B?bVlzZ1QyT0YzSmlHRXlFVDV6Zk5ld3d6WmRLUUNXbmNYQi9iNXgrcWE1YkJZ?=
 =?utf-8?B?YXFrZ0ZBOE9MTWJScWxGd1ZVTXp6eGNJM1plZUZJdTNDN0dEWXdJZFNxZ0pa?=
 =?utf-8?B?Qi9xVCt0MktVRjZaNm9UbkZxckwrcG82ZERmdXJ0ZmtJV1Jvem9FaGVMc2dH?=
 =?utf-8?B?bWlaZW1GU3ZyZ1NpU1dBQkRlaktFU2J4OGJpclI5NTJXa1d3U1V3cms0SVFR?=
 =?utf-8?B?bjc0dlVQOHRIWDc0U2RHdnVtbEM1Z0NXNW9jdFltRG82eEloOUVRQVU0K3FG?=
 =?utf-8?B?ZzBjeWpaWm1YdUM5aW51MUdUdlY3VjMxeVMrUWF2YXJBK0NpT3lvY3ByTGtS?=
 =?utf-8?B?cG1WWjE1QWZCczVyUjVZK2o3aUphWkF2RmxFM0ptZkhZSXhRSExEUmhldlVQ?=
 =?utf-8?B?RG5lTk9YWHhDMWYwR1p5VnNjU2s2V29aWk0wM3M2cmgyZFpBOVY1a2ZsOGVD?=
 =?utf-8?B?VkpqMmNnZFNkR3RVdzlQaDkwWkk4VFZpdlFNQXlxTG44ZFBuSGNpWitGRnpm?=
 =?utf-8?B?dkRxbzRmb3V4RW00bFFXZ24yYm1GTGVBZEw1V0FrSll4aWZUdHRhQkFHK0h6?=
 =?utf-8?B?bU1DdjhNOVhweHhlSWc4cC95N1F2aDNqRFliRE1DUmpaWXU5MEVGSFlrSDUw?=
 =?utf-8?B?N1BRaE9HbDVua3Y5dzQ2aVFPek5rVlpRanBibG8yWS9iMUJ0L2lPRWRvVWdr?=
 =?utf-8?B?Z1RpQzBpS0NmblozVC9WNVRUUkRSZjdVVC9yc1ZyZkNMZjFvNlMrM290a2tj?=
 =?utf-8?B?MExuWGpIblIxanJOUWU0NFRPdG9pMWNDWWNEZlJ3L0ZHdjVOeHlmS1VSRDZV?=
 =?utf-8?B?TXN4eTRWMmdDRndmNlJlOHFQNHcrSnAyZFBSUUF5RTZKYm1OM2RrUHZ5SGgz?=
 =?utf-8?B?bkw5NlZGOFV5WFhwc2tYcTZ5RHJzdEhsR1hXeWtNOU4zWjlGZGlOU0pjaU12?=
 =?utf-8?B?dUdUcmZ2bXRZdTR1RmkydWpqVExnNjZNQ1dVOW03dmQ3V3RwM1NLWmFJRkpm?=
 =?utf-8?B?Ti96YnRXd0ZtR2NJb2JuQ29yYi9pT0NkaDhabTlLNjNkL0J5NkZZdjZvVCtn?=
 =?utf-8?B?Q1NkU256MTRZQW5RbVFLbnUybWNSMGorcHVHY1lyR3ZHc1ZxZkRTbGZWS0hO?=
 =?utf-8?Q?a9N40JXmK5La02P3ug+3JGkOKgPsfv5tUkvE2Cq?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc278be-6896-49db-c89f-08d8d46299b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 23:12:02.2718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WSXzk9jxwfxsvY1FlcQbh8jp0tsQhdGRWBBuZdKCQ5wT6VUXzRQo6tz+wDF4SKw/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3101
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGhhbmtzLA0KDQpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4N
Cg0KUmVnYXJkcywNCktldmluDQoNCj4g5ZyoIDIwMjHlubQy5pyIMTnml6XvvIwwNjo0Oe+8jE5h
dGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4g5YaZ6YGT77yaDQo+IA0KPiDvu79D
bGFuZyB3YXJuczoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211
L3NtdV9jbW4uYzo3NjQ6Mjogd2FybmluZzoNCj4gdmFyaWFibGUgJ3N0cnVjdHVyZV9zaXplJyBp
cyB1c2VkIHVuaW5pdGlhbGl6ZWQgd2hlbmV2ZXIgc3dpdGNoIGRlZmF1bHQNCj4gaXMgdGFrZW4g
Wy1Xc29tZXRpbWVzLXVuaW5pdGlhbGl6ZWRdDQo+ICAgICAgICBkZWZhdWx0Og0KPiAgICAgICAg
Xn5+fn5+fg0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9zd3NtdS9zbXVfY21u
LmM6NzcwOjIzOiBub3RlOg0KPiB1bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQ0KPiAgICAg
ICAgbWVtc2V0KGhlYWRlciwgMHhGRiwgc3RydWN0dXJlX3NpemUpOw0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvLi4vcG0vc3dzbXUvc211X2Ntbi5jOjc1MzoyNTogbm90ZToNCj4gaW5pdGlhbGl6ZSB0aGUg
dmFyaWFibGUgJ3N0cnVjdHVyZV9zaXplJyB0byBzaWxlbmNlIHRoaXMgd2FybmluZw0KPiAgICAg
ICAgdWludDE2X3Qgc3RydWN0dXJlX3NpemU7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMA0KPiAxIHdhcm5pbmcg
Z2VuZXJhdGVkLg0KPiANCj4gUmV0dXJuIGluIHRoZSBkZWZhdWx0IGNhc2UsIGFzIHRoZSBzaXpl
IG9mIHRoZSBoZWFkZXIgd2lsbCBub3QgYmUga25vd24uDQo+IA0KPiBGaXhlczogZGU0YjdjZDhj
Yjg3ICgiZHJtL2FtZC9wbS9zd3NtdTogdW5pZnkgdGhlIGluaXQgc29mdCBncHUgbWV0cmljcyBm
dW5jdGlvbiIpDQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGlu
dXgvaXNzdWVzLzEzMDQNCj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPg0KPiAtLS0NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXVf
Y21uLmMgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211
X2Ntbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXVfY21uLmMNCj4gaW5kZXgg
YmI2MjBmZGQ0Y2QyLi5iY2VkZDRkOTJlMzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vc3dzbXUvc211X2Ntbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
c3dzbXUvc211X2Ntbi5jDQo+IEBAIC03NjIsNyArNzYyLDcgQEAgdm9pZCBzbXVfY21uX2luaXRf
c29mdF9ncHVfbWV0cmljcyh2b2lkICp0YWJsZSwgdWludDhfdCBmcmV2LCB1aW50OF90IGNyZXYp
DQo+ICAgICAgICBzdHJ1Y3R1cmVfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgZ3B1X21ldHJpY3NfdjJf
MCk7DQo+ICAgICAgICBicmVhazsNCj4gICAgZGVmYXVsdDoNCj4gLSAgICAgICAgYnJlYWs7DQo+
ICsgICAgICAgIHJldHVybjsNCj4gICAgfQ0KPiANCj4gI3VuZGVmIE1FVFJJQ1NfVkVSU0lPTg0K
PiAtLSANCj4gMi4zMC4xDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
