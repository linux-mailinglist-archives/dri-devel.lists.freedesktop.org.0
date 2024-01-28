Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AF883FAE0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 00:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F23710FED7;
	Sun, 28 Jan 2024 23:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www254.your-server.de (www254.your-server.de [188.40.28.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B869A10E563;
 Sun, 28 Jan 2024 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=windeck-gymnasium.de; s=windeck_hetzner; h=Content-Type:In-Reply-To:
 References:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=NrVZ6LOmJLHxlx8ybFUnQmgz+pS8CMMfN/yB/76ePI8=; b=FS2kHfsCSZwmlrdcDLLNCDEHVI
 Waty/C52X7A8kYrN7rGIKCtFwc4GQ8/ez4Dwt1Tvs6LeBCZtCjHI/YkRnZbEdKk2Qhh8zZeNiVW3W
 D6bvQARayC0Qxku/5QOYF17ichO9vjyyEQLYgRI0Vk6+BdWrvOx+CvoYKlOwzGLmxmK88kFaPcSLR
 VMmEW4lsCAbHdfITxeXe6h1ZGrubWbKIede1puUpFHP8Jt+J/6qlbpRVIElIpYbrwlZfRTt01tCJj
 ngal6XE/b+2DB7eDmIvjm/0SI7O+nuwnR3TQv9D6wlU7b6tc3mH7dXT7cUCY3oclZQ8CYKTpSLaCi
 DaKAcawg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www254.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <administrator@windeck-gymnasium.de>)
 id 1rU2N3-000G0R-KN; Sun, 28 Jan 2024 11:26:37 +0100
Received: from [2003:c2:2700:8b00:abb7:33fa:4db1:a46e]
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <administrator@windeck-gymnasium.de>)
 id 1rU2N2-0003G1-UY; Sun, 28 Jan 2024 11:26:36 +0100
Message-ID: <dce1d75a-f500-4353-8910-ab3868da2927@windeck-gymnasium.de>
Date: Sun, 28 Jan 2024 11:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Dominik_F=C3=B6rderer?= <administrator@windeck-gymnasium.de>
Subject: Re: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20240126222300.119292-1-hamza.mahfooz@amd.com>
Content-Language: de-DE
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
 boundary="------------Ly6R5scZIekd7BUs9x2hVgiz"
X-Authenticated-Sender: administrator@windeck-gymnasium.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27167/Sat Jan 27 10:40:34 2024)
X-Mailman-Approved-At: Sun, 28 Jan 2024 23:10:36 +0000
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
--------------Ly6R5scZIekd7BUs9x2hVgiz
Content-Type: multipart/mixed; boundary="------------WcBK8s0R5kDCRZOa85GS24fR";
 protected-headers="v1"
From: =?UTF-8?Q?Dominik_F=C3=B6rderer?= <administrator@windeck-gymnasium.de>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Message-ID: <dce1d75a-f500-4353-8910-ab3868da2927@windeck-gymnasium.de>
Subject: Re: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
References: <20240126222300.119292-1-hamza.mahfooz@amd.com>
In-Reply-To: <20240126222300.119292-1-hamza.mahfooz@amd.com>

--------------WcBK8s0R5kDCRZOa85GS24fR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSd2ZSBhcHBsaWVkIHRoZSBwYXRjaCB0byA2LjcuMi4gVGhlIGRldmljZSB0aGVuIHNob3dz
IHVwIHVuZGVyOg0KDQovc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjA4LjEvMDAw
MDpjMTowMC4wL2RybS9jYXJkMS9jYXJkMS1lRFAtMS9hbWRncHUvcGFuZWxfcG93ZXJfc2F2
aW5ncw0KKG9uIEZyYW1ld29yayBMYXB0b3AgMTMgYW1kIDc4NDBVIHdpdGggNzgwTSkuDQoN
CkFmdGVyIGEgZmV3IHRlc3RzIGkgY2FuIHNheSB0aGF0IGF0IGxlYXN0IGluIG15IHN5c3Rl
bSBpdOKAmXMgbm90IHdvcmtpbmcuIA0KU2V0dGluZyBhIHZhbHVlIGJldHdlZW4gMCBhbmQg
NCBpbiAvc3lzLy4uLi9wYW5lbF9wb3dlcl9zYXZpbmdzIGNoYW5nZXMgDQpub3RoaW5nIGlu
IHRoZSBwYW5lbCBiZWhhdmlvci4gVGhlcmUgYXJlIG5vIGVycm9ycyBpbiBrZXJuZWwgbG9n
Lg0KDQpTZXR0aW5nIGFuIGFibWxldmVsIHZpYSBrZXJuZWwgb3B0aW9uIHN0aWxsIHdvcmtz
IGFzIGludGVuZGVkLg0KDQoNClRoZSBpc3N1ZSBjYW4gYmUgcmVzb2x2ZWQgaWYgb25lIHNl
dCB0aGUgcGFuZWxfcG93ZXJfc2F2aW5ncyB2YWx1ZSBhbmQgDQphZnRlciB0aGF0IGNoYW5n
ZSB0aGUgZGlzcGxheSByZXNvbHV0aW9uIHRvIGEgbG93ZXIgdmFsdWUgYW5kIHRoYW4gDQpz
d2l0Y2ggYmFjay4gRm9yIGV4YW1wbGUgdGhpcyBzY3JpcHQgd29ya3M6DQoNCg0KeHRlcm0g
LWUgJ2VjaG8gMCB8IHN1ZG8gdGVlIA0KL3N5cy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDow
MDowOC4xLzAwMDA6YzE6MDAuMC9kcm0vY2FyZDEvY2FyZDEtZURQLTEvYW1kZ3B1L3BhbmVs
X3Bvd2VyX3NhdmluZ3MnDQpnbm9tZS1yYW5kciBtb2RpZnkgLW0gMTkyMHgxMjAwQDU5Ljk5
OSBlRFAtMSAmJiBnbm9tZS1yYW5kciBtb2RpZnkgLW0gDQoyMjU2eDE1MDRANTkuOTk5IGVE
UC0xDQoNCg0KQW0gMjYuMDEuMjQgdW0gMjM6MjIgc2NocmllYiBIYW16YSBNYWhmb296Og0K
PiBXZSB3YW50IHByb2dyYW1zIGJlc2lkZXMgdGhlIGNvbXBvc2l0b3IgdG8gYmUgYWJsZSB0
byBlbmFibGUgb3IgZGlzYWJsZQ0KPiBwYW5lbCBwb3dlciBzYXZpbmcgZmVhdHVyZXMuIEhv
d2V2ZXIsIHNpbmNlIHRoZXkgYXJlIGN1cnJlbnRseSBvbmx5DQo+IGNvbmZpZ3VyYWJsZSB0
aHJvdWdoIERSTSBwcm9wZXJ0aWVzLCB0aGF0IGlzbid0IHBvc3NpYmxlLiBTbywgdG8gcmVt
ZWR5DQo+IHRoYXQgaXNzdWUgaW50cm9kdWNlIGEgbmV3ICJwYW5lbF9wb3dlcl9zYXZpbmdz
IiBzeXNmcyBhdHRyaWJ1dGUuDQo+DQo+IENjOiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8u
bGltb25jaWVsbG9AYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSGFtemEgTWFoZm9veiA8
aGFtemEubWFoZm9vekBhbWQuY29tPg0KPiAtLS0NCj4gLi4uL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNTkgKysrKysrKysrKysrKysrKysrKw0KPiAx
IGZpbGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyANCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGlu
ZGV4IGNkOThiMzU2NTE3OC4uYjNmY2Q4MzMwMTVkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAg
LTY1MzQsNiArNjUzNCw1OCBAQCANCj4gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZHVw
bGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY29ubmVjdG9yIA0KPiAqY29ubmVjdG9yKQ0KPiBy
ZXR1cm4gJm5ld19zdGF0ZS0+YmFzZTsNCj4gfQ0KPiArc3RhdGljIHNzaXplX3QgcGFuZWxf
cG93ZXJfc2F2aW5nc19zaG93KHN0cnVjdCBkZXZpY2UgKmRldmljZSwNCj4gKyBzdHJ1Y3Qg
ZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gKyBjaGFyICpidWYpDQo+ICt7DQo+ICsgc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9IGRldl9nZXRfZHJ2ZGF0YShkZXZpY2Up
Ow0KPiArIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjb25uZWN0b3ItPmRldjsNCj4gKyBz
c2l6ZV90IHZhbDsNCj4gKw0KPiArIGRybV9tb2Rlc2V0X2xvY2soJmRldi0+bW9kZV9jb25m
aWcuY29ubmVjdGlvbl9tdXRleCwgTlVMTCk7DQo+ICsgdmFsID0gdG9fZG1fY29ubmVjdG9y
X3N0YXRlKGNvbm5lY3Rvci0+c3RhdGUpLT5hYm1fbGV2ZWw7DQo+ICsgZHJtX21vZGVzZXRf
dW5sb2NrKCZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rpb25fbXV0ZXgpOw0KPiArDQo+ICsg
cmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJWx1XG4iLCB2YWwpOw0KPiArfQ0KPiArDQo+ICtz
dGF0aWMgc3NpemVfdCBwYW5lbF9wb3dlcl9zYXZpbmdzX3N0b3JlKHN0cnVjdCBkZXZpY2Ug
KmRldmljZSwNCj4gKyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gKyBjb25z
dCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkNCj4gK3sNCj4gKyBzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yID0gZGV2X2dldF9kcnZkYXRhKGRldmljZSk7DQo+ICsgc3RydWN0
IGRybV9kZXZpY2UgKmRldiA9IGNvbm5lY3Rvci0+ZGV2Ow0KPiArIGxvbmcgdmFsOw0KPiAr
IGludCByZXQ7DQo+ICsNCj4gKyByZXQgPSBrc3RydG9sKGJ1ZiwgMCwgJnZhbCk7DQo+ICsN
Cj4gKyBpZiAocmV0KQ0KPiArIHJldHVybiByZXQ7DQo+ICsNCj4gKyBpZiAodmFsIDwgMCB8
fCB2YWwgPiA0KQ0KPiArIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgZHJtX21vZGVzZXRf
bG9jaygmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4LCBOVUxMKTsNCj4gKyB0
b19kbV9jb25uZWN0b3Jfc3RhdGUoY29ubmVjdG9yLT5zdGF0ZSktPmFibV9sZXZlbCA9IHZh
bCA/Og0KPiArIEFCTV9MRVZFTF9JTU1FRElBVEVfRElTQUJMRTsNCj4gKyBkcm1fbW9kZXNl
dF91bmxvY2soJmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCk7DQo+ICsNCj4g
KyByZXR1cm4gY291bnQ7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9SVyhw
YW5lbF9wb3dlcl9zYXZpbmdzKTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUg
KmFtZGdwdV9hdHRyc1tdID0gew0KPiArICZkZXZfYXR0cl9wYW5lbF9wb3dlcl9zYXZpbmdz
LmF0dHIsDQo+ICsgTlVMTA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBh
dHRyaWJ1dGVfZ3JvdXAgYW1kZ3B1X2dyb3VwID0gew0KPiArIC5uYW1lID0gImFtZGdwdSIs
DQo+ICsgLmF0dHJzID0gYW1kZ3B1X2F0dHJzDQo+ICt9Ow0KPiArDQo+IHN0YXRpYyBpbnQN
Cj4gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IpDQo+IHsNCj4gQEAgLTY1NDEsNiArNjU5MywxMyBAQCBhbWRncHVf
ZG1fY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoc3RydWN0IA0KPiBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpDQo+IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsNCj4gaW50
IHI7DQo+ICsgaWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09O
TkVDVE9SX2VEUCkgew0KPiArIHIgPSBzeXNmc19jcmVhdGVfZ3JvdXAoJmNvbm5lY3Rvci0+
a2Rldi0+a29iaiwNCj4gKyAmYW1kZ3B1X2dyb3VwKTsNCj4gKyBpZiAocikNCj4gKyByZXR1
cm4gcjsNCj4gKyB9DQo+ICsNCj4gYW1kZ3B1X2RtX3JlZ2lzdGVyX2JhY2tsaWdodF9kZXZp
Y2UoYW1kZ3B1X2RtX2Nvbm5lY3Rvcik7DQo+IGlmICgoY29ubmVjdG9yLT5jb25uZWN0b3Jf
dHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQpIHx8DQoNCg0KLS0gDQpE
b21pbmlrIEbDtnJkZXJlciAoTmV0endlcmthZG1pbmlzdHJhdG9yKQ0KV2luZGVjay1HeW1u
YXNpdW0gQsO8aGwNCkh1bWJvbGR0c3RyLiAzDQpUZWwuIDA3MjIzLzk0MDk1ODUNCg0K

--------------WcBK8s0R5kDCRZOa85GS24fR--

--------------Ly6R5scZIekd7BUs9x2hVgiz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEElI1pgP+MCebrMFDXw0bnevoHXl4FAmW2K9wFAwAAAAAACgkQw0bnevoHXl4K
mgf/fB3uL63KZszImZy1nKm/g7t8uQD0YgE86rQf0UVkNNYKh0qoSH7C7gz3HVTTbPJiqhK37v15
iI8E1mMpXrMjKcrg4cdFhM3HQJBynUtAYZ+5+cMG2eoqDmldRQDvXz5H3BwoPWuMBBJwi+zbhDMp
+hrUrQr5scIasahWFJjuRTD4LKvKTipeCFnz3x32dJjrYb3ZAAmTQ8yNu4UaAghBS8B3aQcCcwNu
GCEIs25ykY5r6eSk+XYFJs0bIJC/Map7adgLeTxABAJpGgLYKWiUF/+K9dqgVj9G7+8dmhK3phck
VXQP0T1GjkklYCYnvczilKewBnF3NC1H1lMm3p2u4A==
=G/Md
-----END PGP SIGNATURE-----

--------------Ly6R5scZIekd7BUs9x2hVgiz--
