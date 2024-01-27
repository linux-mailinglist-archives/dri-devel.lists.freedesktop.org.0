Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF5A83EFCD
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 20:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99A510E6C5;
	Sat, 27 Jan 2024 19:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1759 seconds by postgrey-1.36 at gabe;
 Sat, 27 Jan 2024 18:50:43 UTC
Received: from www254.your-server.de (www254.your-server.de [188.40.28.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAC710ED91;
 Sat, 27 Jan 2024 18:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=windeck-gymnasium.de; s=windeck_hetzner; h=Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=cCh/PG7HRY+2FusfuHZo8+iALKdUcyERh3vLdxoPf1s=; b=KteZMf4OwCFYpPItblGjeL5KNk
 1Kous0K9GVq6Sya6vet1uTTLCJO/0pzu/grhLItaR2DiCOZ6Pb7Q2CQ0AUynL65xuL5p8Ct+F0KgB
 F+1UbU6BndYH8DWfzpqlMeDBA/W5CBEdWJCvtZSYE/+sgGyz7iRMZhKQqJs7mZWW5Aioxp4fqk2fN
 2OrDsBJZx/+T/IIsT12DC8IWgSl1eMD8xuHK50PDD/WsR+hN2yhyrtIc1xEdIc3loZVQqkGNb5FNT
 HS8ev8OxJlGSHjjeMcU1xvS6Eiti8RqFyHk9+pg22WK/K8775lclMtCJxXkYBsdIf+9xH8So8UUsF
 W1d5kmJA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www254.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <administrator@windeck-gymnasium.de>)
 id 1rTnIu-000KXb-9B; Sat, 27 Jan 2024 19:21:20 +0100
Received: from [2003:c2:2700:8b00:abb7:33fa:4db1:a46e]
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <administrator@windeck-gymnasium.de>)
 id 1rTnIt-000K5o-KP; Sat, 27 Jan 2024 19:21:19 +0100
Message-ID: <945c2362-9245-438c-9235-59e6773111b1@windeck-gymnasium.de>
Date: Sat, 27 Jan 2024 19:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20240126222300.119292-1-hamza.mahfooz@amd.com>
Content-Language: de-DE
From: =?UTF-8?Q?Dominik_F=C3=B6rderer?= <administrator@windeck-gymnasium.de>
Autocrypt: addr=administrator@windeck-gymnasium.de; keydata=
 xsBNBFKEx0EBCACd+Hh66bJTTKR2iOs4HhtIzDjZl17s3eOLhYYpTAbCbhuCDzvTOhUTuu3z
 kB1invo1QlleId5WtW2c4GTXTKpRy0H9tPLuH0eGJNV2YbfakqSDNRXf/azZQjgjrMps7YES
 ibXG2fE1vV4jxsV0Uurq/+lEaW99Jynnti+aiCw7XDopDz2OFC20oZ968ulxB5AB5s/uK2lY
 PYZy7rEPZWsv/3sxHwKogt8XOM3xoz59nyBq1+jqMQuIRgDry5GvPUF6y/yapA9eCQO7dhHe
 5gA8uttA7nicQc109EIZyZ1NN/qmyvf/Xuku3nyhHC+AD2VBog5TpWzqE/MKKk+tVTJvABEB
 AAHNNkRvbWluaWsgRsO2cmRlcmVyIDxhZG1pbmlzdHJhdG9yQHdpbmRlY2stZ3ltbmFzaXVt
 LmRlPsLAjwQTAQgAOQIbIwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSUjWmA/4wJ5usw
 UNfDRud6+gdeXgUCXZ7oLQAKCRDDRud6+gdeXrQlB/9YwT0UJeLilU5Fqmh2NDOhn4dCsLNq
 yNnKt3d88wxnonz6Z3j+Nn/3sKt0LgyinQx6dNuhp67DibpYDw01GomnSlcmdAQ/YG7y4CB5
 Mtcszm7gYUSUd1FlYwgpkAC3CEhLDJTyuuLZ3KNUIxITonp+ui3CrXTBF+vrRGvZq9WiyNcp
 s6LsQHWKw5VgvGhLklkjG5fxWj6EOI1N9T2VcLt41ZuVcDg9Vn/Je3/6n/g7UjFAsVPydvdm
 /37HGp/crj7+GKy9XMDRJfKddObAQ6w0NRpky+JFtnMuZXHEDy3dfO+K2cX66Jtr0kdjLiT4
 77kd9acZ6B6QGJSq6WeO8/T2zsBNBFKEx0EBCADaI8479bL9mlzZYMNo+H+62mj35DDg6Oxl
 kgsEu/oKK8PY1gBbWOjiKZTP4ty3aw+0XsNsdVbbXV0rYvUvnyPIQoImIu77q/hw7OTJcjNI
 G3XCnSFgQW8r2aooFTqFQpq4o9IiVKAPLviHi3XipOLLisGYKEen3NtNXyc1vFFHu7d3qeaP
 X1hpmwizoQ10WpUvYkaLa0vFcRWyRzhf8reDlU9t2c/YV+eGjl4WSmxEEDehYZGMO02pxo2P
 F05FZorKWJ/9eL5xBkKB9TmldgFmtDF4Xeykz1+USxDacTCy05GSVD7eegkfIeVpgphiuP0u
 yQ1BJjg2HTO3AfWF3YUzABEBAAHCwHYEGAEIACACGwwWIQSUjWmA/4wJ5uswUNfDRud6+gde
 XgUCXZ7oOgAKCRDDRud6+gdeXilFB/0bVk9EFIbxl1EuYfvtESz/5+ixMQ7d5nNv4XlcrxY+
 ayfqAGzuJ1tvCtuHtiGJSTx4Ta83ysSbRYEexppLbJINjBr5J4R4wL6SOxj6Y0+JUZ1YJKmb
 D9K4BRknNuxdRZO/AmZ2TwrGemirAIf0EZFAPi4Uvp/xZs2svXTU6P4jb8p9MohEQCpaoQIe
 LAiFzLfK2eJMGjrQMFhnRe2pv7z54qLQ4wYdG1CGUkXivul+4y0yhp3W2mu5XSqxa0Tkzhy1
 X8x6aSSiURHeu7RPJnlBgFJbfhggsj4ZO0Yz5chC0YCu3CTMm/e6BgphRTxl8wFoQ3+STrT5
 dPs3WyUXqakj
In-Reply-To: <20240126222300.119292-1-hamza.mahfooz@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------acHOrLA0e0X0SGLsitEsjtU1"
X-Authenticated-Sender: administrator@windeck-gymnasium.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27167/Sat Jan 27 10:40:34 2024)
X-Mailman-Approved-At: Sat, 27 Jan 2024 19:42:34 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------acHOrLA0e0X0SGLsitEsjtU1
Content-Type: multipart/mixed; boundary="------------FmWQ3gdavx0ywoUh9fuMSTb0";
 protected-headers="v1"
From: =?UTF-8?Q?Dominik_F=C3=B6rderer?= <administrator@windeck-gymnasium.de>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Message-ID: <945c2362-9245-438c-9235-59e6773111b1@windeck-gymnasium.de>
Subject: Re: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
References: <20240126222300.119292-1-hamza.mahfooz@amd.com>
In-Reply-To: <20240126222300.119292-1-hamza.mahfooz@amd.com>

--------------FmWQ3gdavx0ywoUh9fuMSTb0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSd2ZSBhcHBsaWVkIHRoZSBwYXRjaCB0byA2LjcuMi4gVGhlIGRldmljZSB0aGVuIHNob3dz
IHVwIHVuZGVyOg0KDQp8L3N5cy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowOC4xLzAw
MDA6YzE6MDAuMC9kcm0vY2FyZDEvY2FyZDEtZURQLTEvYW1kZ3B1L3BhbmVsX3Bvd2VyX3Nh
dmluZ3N8DQp8fHwob24gRnJhbWV3b3JrIExhcHRvcCAxMyBhbWQgNzg0MFUgd2l0aCA3ODBN
KS58DQp8fA0KQWZ0ZXIgYSBmZXcgdGVzdHMgaSBjYW4gc2F5IHRoYXQgYXQgbGVhc3QgaW4g
bXkgc3lzdGVtIGl04oCZcyBub3Qgd29ya2luZy4gDQpTZXR0aW5nIGEgdmFsdWUgYmV0d2Vl
biAwIGFuZCA0IGluIC9zeXMvLi4uL3BhbmVsX3Bvd2VyX3NhdmluZ3MgY2hhbmdlcyANCm5v
dGhpbmcgaW4gdGhlIHBhbmVsIGJlaGF2aW9yLiBUaGVyZSBhcmUgbm8gZXJyb3JzIGluIGtl
cm5lbCBsb2cuDQoNClNldHRpbmcgYW4gYWJtbGV2ZWwgdmlhIGtlcm5lbCBvcHRpb24gc3Rp
bGwgd29ya3MgYXMgaW50ZW5kZWQuDQoNCnx8QW4gb3RoZXIgaW52ZXN0aWdhdGlvbiBpcywg
dGhhdCB3aGVuIHNldHRpbmcgYWJtbGV2ZWw9MCB2aWEga2VybmVsIA0Kb3B0aW9uIHRoZSB2
YWx1ZSBzaG93biBpbiAvc3lzLy4uLi9wYW5lbF9wb3dlcl9zYXZpbmdzIGlzIDI1NSBpbnN0
ZWFkIG9mIA0KMC4gRm9yIGFibWxldmUgdmFsdWVzIDEgdG8gNCBzZXQgdmlhIGtlcm5lbCBv
cHRpb24gdGhlIHZhbHVlcyBzaG93biBpbiANCi9zeXMvLi4uL3BhbmVsX3Bvd2VyX3Nhdmlu
Z3MgYXJlIHRoZSBzYW1lLg0KDQoNCnx8DQoNCkFtIDI2LjAxLjI0IHVtIDIzOjIyIHNjaHJp
ZWIgSGFtemEgTWFoZm9vejoNCj4gV2Ugd2FudCBwcm9ncmFtcyBiZXNpZGVzIHRoZSBjb21w
b3NpdG9yIHRvIGJlIGFibGUgdG8gZW5hYmxlIG9yIGRpc2FibGUNCj4gcGFuZWwgcG93ZXIg
c2F2aW5nIGZlYXR1cmVzLiBIb3dldmVyLCBzaW5jZSB0aGV5IGFyZSBjdXJyZW50bHkgb25s
eQ0KPiBjb25maWd1cmFibGUgdGhyb3VnaCBEUk0gcHJvcGVydGllcywgdGhhdCBpc24ndCBw
b3NzaWJsZS4gU28sIHRvIHJlbWVkeQ0KPiB0aGF0IGlzc3VlIGludHJvZHVjZSBhIG5ldyAi
cGFuZWxfcG93ZXJfc2F2aW5ncyIgc3lzZnMgYXR0cmlidXRlLg0KPg0KPiBDYzogTWFyaW8g
TGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEhhbXphIE1haGZvb3ogPGhhbXphLm1haGZvb3pAYW1kLmNvbT4NCj4gLS0tDQo+ICAg
Li4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNTkgKysr
KysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCsp
DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYw0KPiBpbmRleCBjZDk4YjM1NjUxNzguLmIzZmNkODMzMDE1ZCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jDQo+IEBAIC02NTM0LDYgKzY1MzQsNTggQEAgYW1kZ3B1X2RtX2Nvbm5l
Y3Rvcl9hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpDQo+ICAgCXJldHVybiAmbmV3X3N0YXRlLT5iYXNlOw0KPiAgIH0NCj4gICANCj4g
K3N0YXRpYyBzc2l6ZV90IHBhbmVsX3Bvd2VyX3NhdmluZ3Nfc2hvdyhzdHJ1Y3QgZGV2aWNl
ICpkZXZpY2UsDQo+ICsJCQkJCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiAr
CQkJCQljaGFyICpidWYpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciA9IGRldl9nZXRfZHJ2ZGF0YShkZXZpY2UpOw0KPiArCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYgPSBjb25uZWN0b3ItPmRldjsNCj4gKwlzc2l6ZV90IHZhbDsNCj4gKw0KPiArCWRy
bV9tb2Rlc2V0X2xvY2soJmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCwgTlVM
TCk7DQo+ICsJdmFsID0gdG9fZG1fY29ubmVjdG9yX3N0YXRlKGNvbm5lY3Rvci0+c3RhdGUp
LT5hYm1fbGV2ZWw7DQo+ICsJZHJtX21vZGVzZXRfdW5sb2NrKCZkZXYtPm1vZGVfY29uZmln
LmNvbm5lY3Rpb25fbXV0ZXgpOw0KPiArDQo+ICsJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAi
JWx1XG4iLCB2YWwpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgc3NpemVfdCBwYW5lbF9wb3dl
cl9zYXZpbmdzX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldmljZSwNCj4gKwkJCQkJIHN0cnVj
dCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiArCQkJCQkgY29uc3QgY2hhciAqYnVmLCBz
aXplX3QgY291bnQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciA9IGRldl9nZXRfZHJ2ZGF0YShkZXZpY2UpOw0KPiArCXN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYgPSBjb25uZWN0b3ItPmRldjsNCj4gKwlsb25nIHZhbDsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJcmV0ID0ga3N0cnRvbChidWYsIDAsICZ2YWwpOw0KPiArDQo+ICsJaWYgKHJldCkN
Cj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCWlmICh2YWwgPCAwIHx8IHZhbCA+IDQpDQo+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJZHJtX21vZGVzZXRfbG9jaygmZGV2LT5t
b2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4LCBOVUxMKTsNCj4gKwl0b19kbV9jb25uZWN0
b3Jfc3RhdGUoY29ubmVjdG9yLT5zdGF0ZSktPmFibV9sZXZlbCA9IHZhbCA/Og0KPiArCQlB
Qk1fTEVWRUxfSU1NRURJQVRFX0RJU0FCTEU7DQo+ICsJZHJtX21vZGVzZXRfdW5sb2NrKCZk
ZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgpOw0KPiArDQo+ICsJcmV0dXJuIGNv
dW50Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcocGFuZWxfcG93ZXJf
c2F2aW5ncyk7DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICphbWRncHVfYXR0
cnNbXSA9IHsNCj4gKwkmZGV2X2F0dHJfcGFuZWxfcG93ZXJfc2F2aW5ncy5hdHRyLA0KPiAr
CU5VTEwNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dy
b3VwIGFtZGdwdV9ncm91cCA9IHsNCj4gKwkubmFtZSA9ICJhbWRncHUiLA0KPiArCS5hdHRy
cyA9IGFtZGdwdV9hdHRycw0KPiArfTsNCj4gKw0KPiAgIHN0YXRpYyBpbnQNCj4gICBhbWRn
cHVfZG1fY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikNCj4gICB7DQo+IEBAIC02NTQxLDYgKzY1OTMsMTMgQEAgYW1kZ3B1X2RtX2Nv
bm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ip
DQo+ICAgCQl0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7DQo+ICAgCWludCBy
Ow0KPiAgIA0KPiArCWlmIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RF
X0NPTk5FQ1RPUl9lRFApIHsNCj4gKwkJciA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmY29ubmVj
dG9yLT5rZGV2LT5rb2JqLA0KPiArCQkJCSAgICAgICAmYW1kZ3B1X2dyb3VwKTsNCj4gKwkJ
aWYgKHIpDQo+ICsJCQlyZXR1cm4gcjsNCj4gKwl9DQo+ICsNCj4gICAJYW1kZ3B1X2RtX3Jl
Z2lzdGVyX2JhY2tsaWdodF9kZXZpY2UoYW1kZ3B1X2RtX2Nvbm5lY3Rvcik7DQo+ICAgDQo+
ICAgCWlmICgoY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNU
T1JfRGlzcGxheVBvcnQpIHx8DQoNCi0tIA0KRG9taW5payBGw7ZyZGVyZXIgKE5ldHp3ZXJr
YWRtaW5pc3RyYXRvcikNCldpbmRlY2stR3ltbmFzaXVtIELDvGhsDQpIdW1ib2xkdHN0ci4g
Mw0KVGVsLiAwNzIyMy85NDA5NTg1DQoNCg==

--------------FmWQ3gdavx0ywoUh9fuMSTb0--

--------------acHOrLA0e0X0SGLsitEsjtU1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEElI1pgP+MCebrMFDXw0bnevoHXl4FAmW1SZ4FAwAAAAAACgkQw0bnevoHXl74
IQf/VZ6ne/BrNrp+eZ5acwNrqVIoWptGrH5oqmTkqCOD6xIfyOW4o2Odxp96fLcYsQp43gXiJtbU
mAv/AC8Hgqw+j/nHYYgAebpTQV+TLdyygqXiv6EToyANNLpSp4SW9qiuiKUad7pq9stakc6lUqKa
bPb7ANSUZDudtuJLd3RauRdgVoLRdEpnai8gnb6J3LKqL3spoDbOx5HQwSt02JdS5m33wi2zrqr4
c1ncuk97ILns2WLqHAmXk67UiI2PPzfVK3R0qTarxzLfI4eQMPT8sAJIr77hG3LAZOLWEoY/eOHo
ZqP972+bvMx0ZDWbNjEMfzoeVLn90eAtq2SGNaTyXg==
=967L
-----END PGP SIGNATURE-----

--------------acHOrLA0e0X0SGLsitEsjtU1--
