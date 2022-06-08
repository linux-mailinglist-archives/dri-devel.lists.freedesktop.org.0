Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C72543F55
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 00:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A23410F53D;
	Wed,  8 Jun 2022 22:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-94-112-206-30.net.upcbroadband.cz [94.112.206.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CDC10F53D;
 Wed,  8 Jun 2022 22:45:26 +0000 (UTC)
Received: from [10.0.0.209] (_gateway [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 74DCB2007F;
 Thu,  9 Jun 2022 00:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1654728323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=h0BSv0vKu5DatC734R9Ooc06RtIa7tCngue/BoZ/h9E=;
 b=jo+zFah2+f6C90tZ83IhiX/HdHCdSn3nzOgtOtqWj56RbDntob0j5Pnf8P5EmJ+dP1Z/rq
 EKz1K8E29qMQa0hYyZtHpZTKzmWEdnLL9t4BjZuiio+FQw5esdb0u7pPKJIFVlC59lhyh7
 LxlaqP8F/ubQm+eEsZDvY3rGuphwsmQ=
Message-ID: <f1489ae9-268a-5e35-2223-e8ee95cbd206@ixit.cz>
Date: Thu, 9 Jun 2022 00:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
 <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
Subject: Re: [PATCH v2 01/12] dt-bindings: display/msm: hdmi: split and
 convert to yaml
In-Reply-To: <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7l0zI1gVkgNMPsdLvfjxdyrG"
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7l0zI1gVkgNMPsdLvfjxdyrG
Content-Type: multipart/mixed; boundary="------------CWtrGXdNxPwn0aOPzmgT6zW3";
 protected-headers="v1"
From: David Heidelberg <david@ixit.cz>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Message-ID: <f1489ae9-268a-5e35-2223-e8ee95cbd206@ixit.cz>
Subject: Re: [PATCH v2 01/12] dt-bindings: display/msm: hdmi: split and
 convert to yaml
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
 <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
In-Reply-To: <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>

--------------CWtrGXdNxPwn0aOPzmgT6zW3
Content-Type: multipart/mixed; boundary="------------I1034yLSgdusPEf8xlfDkfBX"

--------------I1034yLSgdusPEf8xlfDkfBX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDgvMDYvMjAyMiAxNDozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24g
MDgvMDYvMjAyMiAxNDowNywgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4+IENvbnZlcnQg
UXVhbGNvbW0gSERNSSBiaW5kaW5nIGludG8gSERNSSBUWCBhbmQgUEhZIHlhbWwgYmluZGlu
Z3MuDQo+Pg0KPj4gQ2hhbmdlcyB0byBzY2hlbWE6DQo+PiBIRE1JOg0KPj4gICAtIGZpeGVk
IHJlZy1uYW1lcyBudW1iZXJpbmcgdG8gbWF0Y2ggMC4uMyBpbnN0ZWFkIDAsMSwzLDQNCj4+
ICAgLSBkcm9wcGVkIHFjb20sdHgtZGRjLSogZnJvbSBleGFtcGxlLCB0aGV5IHdlcmUgbm90
IGRvY3VtZW50ZWQNCj4+DQo+PiBQSFk6DQo+PiAgIC0gbW92ZWQgaW50byBwaHkvIGRpcmVj
dG9yeQ0KPj4gICAtIHNwbGl0IGludG8gUU1QIGFuZCBub24tUU1QIFBIWSBzY2hlbWFzDQo+
Pg0KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBEYXZpZCBIZWlkZWxiZXJnIDxkYXZpZEBpeGl0LmN6
Pg0KPiBEYXZpZCBhbHNvIG5lZWRzIHRvIFNvQiBoZXJlLg0KDQpubyBwcm9ibGVtLCBmb3Ig
dGhpcyBvciBhbnkgbGF0ZXIgdmVyc2lvbiBvZiBwYXRjaGVzIGRldmVsb3BlZCBieSBtZToN
Cg0KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGVpZGVsYmVyZyA8ZGF2aWRAaXhpdC5jej4NCg0K
Pg0KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtv
dkBsaW5hcm8ub3JnPg0KPj4gLS0tDQo+ICguLi4pDQo+DQo+PiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21zbS9oZG1pLnlhbWwjDQo+PiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+PiAr
DQo+PiArdGl0bGU6IFF1YWxjb21tIEFkcmVuby9TbmFwZHJhZ29uIEhETUkgb3V0cHV0DQo+
PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdt
YWlsLmNvbT4NCj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+
ICsgICAgZW51bToNCj4+ICsgICAgICAtIHFjb20saGRtaS10eC04MDg0DQo+PiArICAgICAg
LSBxY29tLGhkbWktdHgtODY2MA0KPj4gKyAgICAgIC0gcWNvbSxoZG1pLXR4LTg5NjANCj4+
ICsgICAgICAtIHFjb20saGRtaS10eC04OTc0DQo+PiArICAgICAgLSBxY29tLGhkbWktdHgt
ODk5NA0KPj4gKyAgICAgIC0gcWNvbSxoZG1pLXR4LTg5OTYNCj4+ICsNCj4+ICsgIGNsb2Nr
czoNCj4+ICsgICAgbWluSXRlbXM6IDENCj4+ICsgICAgbWF4SXRlbXM6IDUNCj4+ICsNCj4+
ICsgIGNsb2NrLW5hbWVzOg0KPj4gKyAgICBtaW5JdGVtczogMQ0KPj4gKyAgICBtYXhJdGVt
czogNQ0KPj4gKw0KPj4gKyAgcmVnOg0KPj4gKyAgICBtaW5JdGVtczogMQ0KPj4gKyAgICBt
YXhJdGVtczogMw0KPj4gKw0KPj4gKyAgcmVnLW5hbWVzOg0KPj4gKyAgICBtaW5JdGVtczog
MQ0KPj4gKyAgICBpdGVtczoNCj4+ICsgICAgICAtIGNvbnN0OiBjb3JlX3BoeXNpY2FsDQo+
PiArICAgICAgLSBjb25zdDogcWZwcm9tX3BoeXNpY2FsDQo+PiArICAgICAgLSBjb25zdDog
aGRjcF9waHlzaWNhbA0KPj4gKw0KPj4gKyAgaW50ZXJydXB0czoNCj4+ICsgICAgbWF4SXRl
bXM6IDENCj4+ICsNCj4+ICsgIHBoeXM6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+
PiArICBwaHktbmFtZXM6DQo+PiArICAgIGVudW06DQo+PiArICAgICAgLSBoZG1pX3BoeQ0K
Pj4gKyAgICAgIC0gaGRtaS1waHkNCj4gSSBkaWQgbm90IG5vdGljZSB5b3VyIHF1ZXN0aW9u
IG9uIHYxLiBJIHNlZSBub3cgdHdvIERUUyBmaWxlcyB1c2luZyB0d28NCj4gZGlmZmVyZW50
IG5hbWVzLi4uIHllYWgsIGxldCdzIG1hcmsgaXQgZGVwcmVjYXRlZCBhbmQgcmVtb3ZlIGVu
dGlyZWx5DQo+IGZyb20gRFRTLiBMZXQncyBob3BlIERUUyBkb2VzIG5vdCBoYXZlIG90aGVy
IHVzZXJzIHRoYW4gTGludXgga2VybmVsLiA6KQ0KPg0KPj4gKw0KPj4gKyAgY29yZS12ZGRh
LXN1cHBseToNCj4+ICsgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gVkREQSBzdXBwbHkg
cmVndWxhdG9yDQo+PiArDQo+PiArICBoZG1pLW11eC1zdXBwbHk6DQo+PiArICAgIGRlc2Ny
aXB0aW9uOiBwaGFuZGxlIHRvIG11eCByZWd1bGF0b3INCj4+ICsNCj4+ICsgIGNvcmUtdmNj
LXN1cHBseToNCj4+ICsgICAgZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gVkNDIHN1cHBseSBy
ZWd1bGF0b3INCj4+ICsNCj4gKC4uLikNCj4NCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29t
cGF0aWJsZToNCj4+ICsgICAgZW51bToNCj4+ICsgICAgICAtIHFjb20saGRtaS1waHktODY2
MA0KPj4gKyAgICAgIC0gcWNvbSxoZG1pLXBoeS04OTYwDQo+PiArICAgICAgLSBxY29tLGhk
bWktcGh5LTg5NzQNCj4+ICsgICAgICAtIHFjb20saGRtaS1waHktODA4NA0KPj4gKw0KPj4g
KyAgcmVnOg0KPj4gKyAgICBtYXhJdGVtczogMg0KPj4gKw0KPj4gKyAgcmVnLW5hbWVzOg0K
Pj4gKyAgICBpdGVtczoNCj4+ICsgICAgICAtIGNvbnN0OiBoZG1pX3BoeQ0KPj4gKyAgICAg
IC0gY29uc3Q6IGhkbWlfcGxsDQo+PiArDQo+PiArICBjbG9ja3M6DQo+PiArICAgIG1pbkl0
ZW1zOiAxDQo+PiArICAgIG1heEl0ZW1zOiAyDQo+PiArDQo+PiArICBjbG9jay1uYW1lczoN
Cj4+ICsgICAgbWluSXRlbXM6IDENCj4+ICsgICAgbWF4SXRlbXM6IDINCj4+ICsNCj4+ICsg
IHBvd2VyLWRvbWFpbnM6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBjb3Jl
LXZkZGEtc3VwcGx5Og0KPj4gKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBWRERBIHN1
cHBseSByZWd1bGF0b3INCj4gQmxhbmsgbGluZQ0KPg0KPj4gKyAgdmRkaW8tc3VwcGx5Og0K
Pj4gKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBWREQgSS9PIHN1cHBseSByZWd1bGF0
b3INCj4+ICsNCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KLS0gDQpEYXZp
ZCBIZWlkZWxiZXJnDQpDb25zdWx0YW50IFNvZnR3YXJlIEVuZ2luZWVyDQoNCk1hdHJpeDog
QG9raWFzOm1hdHJpeC5vcmcNCg0K
--------------I1034yLSgdusPEf8xlfDkfBX
Content-Type: application/pgp-keys; name="OpenPGP_0x60023FC4D3492072.asc"
Content-Disposition: attachment; filename="OpenPGP_0x60023FC4D3492072.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBF5v1x4BEADS3EddwsNsvVAI1XF8uQKbdYPY/GhjaSLziwVnbwv5BGwqB1tf
XoHnccoA9kTgKAbiXG/CiZFhD6l4WCIskQDKzyQN3JhCUIxh16Xyw0lECI7iqoW9
LmMoN1dNKcUmCO9glZxQaOl+1bY/7ttd7DapLh9rmBXJ2lKiMEaIpUwb/Nw0d7En
p4Jy2TpkhPywIpUn8CoJCv3/61qbvI9y5utB/UhfMAUXsaAgwEJyGPAqHlC0YZja
TwOu+YQUE3AFzhCbksq95CwDz4U4gdlsdmv9tkATfu2OmzERZQ6vJTehK0Pu4l5K
mCAzYg42I9Dy4E6b17x6NncKbcByQFOXMtG0qVUkF1yeeOQUHwu+8t3ZDMBUhCkR
L/juuoqLmyDWKMc0hKNNeZ9BNXgB8fXkRLWEUfgDXsFyEkKpNxUy5bDRlivf6XfE
xnikk5kj9l2gGlNQwqROti/46bfbmlmc/a2GM4k8ZyalHNEAdwtXYSpP8JJmlbQ7
hNTLkc3HQLRsIocN5th/ur7pPMz1Beyp0gbE9GcOceqmdZQB80vJ01XDyCAihf6l
AMnzwpXZsjqIqH9r7T7tM6tVEVbPSwPt4eZYXSoJijEBC/43TBbmxDX+5+3txRaS
CRQrG9dYk3mMGM3xJLCps2KnaqMcgUnvb1KdTgEFUZQaItw7HyRd6RppewARAQAB
zSBEYXZpZCBIZWlkZWxiZXJnIDxkYXZpZEBpeGl0LmN6PsLBlAQTAQgAPhYhBNd6
Cc/u3Cu9U6cEdGACP8TTSSByBQJeb9ceAhsDBQkHhM4ABQsJCAcCBhUKCQgLAgQW
AgMBAh4BAheAAAoJEGACP8TTSSByFucP/iu03BSrScw/FnyMjDHoQ6fOLNLbMoDF
SBZJA5eZl3Fv0M9wcdTjQQrOVl1qDzcO1HeOS8Gz3KFtT49lgvNHYIm1p75Eng4B
BBzQ0wxzLL9haSdJlxDGY2VEvDHQ4h8FqhKhPyWUVya741yBo/jUSkdqiBvrEVqw
K9U7lR/C2B6Yotwhp8i1QdG6qSFZNWDuofMhtMQcYpdEUyC6dteOcRDbu1ktBLuY
NjUvFSl5/NLzpNNo+bJ/hD4htvpQD0jLg0rtc6TMoP22mzC1zH6e6wITPqyLBvPf
fAXc31i98DPCRu4vKhQBkHNbxVquDASMepTZUF5Gthzt3mBw/+MkxlR3tCwdx1L+
CxCGxjsk/GjW3beY/Z77FhOss4fB6AlD/Dq+wxOQlaZr5C8SX7a8FgqRVaIjeoLc
RaVfOnLGfZAEGcxeahdUMr1LkVRWuUZxhOJk01JVYp2GzgdGdcvJ8dXfyhMKRhE9
VuB/VykEtOlfc41mrCZ6rz3Gep4TPTHtClYAohGYNunjoImYYp0ScvlHbtRz8UvR
CCRGYMBh5rBhilF2gqLcjaRProon/KVv52kAsTHUqw8Ldf5tPJwPLhV6aFI5DkU9
cRoFr8ib3ZGDva5LxZUf1fuiGRyDNXMJmsW5/9Dp3Dt7FUMvZvcrSmPIsZXIQ2QD
/mUeuXftINQVwsFzBBABCgAdFiEEtRmpJow29txOd+GHTK7iH8zfXScFAmKObIwA
CgkQTK7iH8zfXSdD8hAAnivM5EKALfQct78kbMALuqnry/N8+ekkN4h+Q6N9gu97
5ouo8QQ5GfU2k23Dy6PlyAZO5ompKK5MuRDNjN+U66T4qn/fvghh+U30VqDNzGyW
MMBWvacSOrxsoI1NufjFsbRbrlV91ZtLmBNzrEWaN/J10162Fw+GFjDNHt3jqRfw
iD6plQsolOcLIidrDWIFEBY1xCVFYirGycPhFElbiHm5rKcjAlGdTrlkJohB3fo8
8MDgcYBTi0cLEDXEcDbXwF1iIJlycBqBGHPD18+Da3k43LS900sYkuxZuTHdF/R5
okyKRxqVj6ictOqg5Ra/9balPL36lDbbUypGsxVAfbFgR7CCa01KFpS7hqzixUzD
o3JS5Hs1KWjSi7SrbMDHpi8VAdj3c7sZVkWMyk2Nx+Kvs59kCbYXbr9mKz07/6wh
9MlhFhnTZQjPFjVVG62WGfyM+PMv6Yvwc3aHtFsAiCN2Y8mAFHAQElyMEztyl2Ad
ZIs89LZgTjoUzE1q3BhXXE2yapuOqR4dR725B5rUR/H8HQUePKBQC/eqvOn6gCqa
QNHl6HXEznU/DbZEUMpSxWWolNlAnGvlKyAX88x1ijY8eiDhlLlGhwIWhjq0Eh46
6cebG/BIlSA1R2e7whmXb9207P5Hpqxj3JfWbH4iNx9mFtjVyTuIPxMKnfUk7OjO
wU0EXm/XHgEQAOeWtu1rZYvzsGUQ6i1lSHTNcA0ys1XXlbF7GyKst61+puzQAYJp
NE2P65aVNQMlFc5UjDOYXvpSzcjbv3r453ahw2kuF5nsQiSrxu520tV3VzTqon4Y
ytrPnXN+BIhrNUic0w+T1Pp/PSV6ZuOLnIRw0800EDiweIWZd+giF6kcU4ECmNLQ
KI4+qjBjFJM978Mtwn8sPBalOLft2go+EHCUd6/UHBUJussQgWNjQwszRpOOIEGX
IslpOq8TjyBuWie7ZIZo2Ya2QLdWhBRAVxVgNe2Uv0JVs2jsEC3mDA9w2oSqRQvr
QmEW29VIrJCHqCfscezIy2CW2Nnc0qO/xLfJB3vPG8Kfv20IrCh416+y+gyr9vOU
rFz1CIppE85oOPcW1btH/degokFjwdyTK6Dq5zaphZGme5dzRqzpLTB96TqBq4TF
S20Equ1Js88eK5N40e02xPj53K9om1Ao8FNs8eRelM7x7X5gCDuQ+PdooVOgT91q
QiHyKpQcs3HLAMBqZFWfwdrrtY4AQADeKSUnj1BCTZnJLVEnZSXbx48UNndBKv0u
gmI4Fm/1eRuFdLXriJEHusFmTplFWALPdXqGGGOSKli+kn9+mNc2xUvyO96XWZg1
/RrjpPhBANDHgpCPTNclsLZ8WKQC27UBQuS0XiIRcQitKMWiqF3h65n5ABEBAAHC
wXwEGAEIACYWIQTXegnP7twrvVOnBHRgAj/E00kgcgUCXm/XHgIbDAUJB4TOAAAK
CRBgAj/E00kgclNmD/42oDiQZq7DSoBHVubZVVoMmNqOMl6sMuv+4wSAEKgNeIO7
ShtndfAwN7aiFfFXgvzvkHur+XOBZH9isk1TcKQwWSc9mX76BWGQFnTFCEyzQewg
SANMqBfdsoIjLueIdUyrpLy1izZ5Ocro0RAVavZWrp8BPw2NgyFoBsgy9l/P+EKT
DNYPlBN6NmK6U/oKXgBVria6foXMykcBxeT811KBZg7R/sC1b4rMgoqtxPYdwMEY
zY5o+4RqMcVf/WXLJE4uIZyDP0T/lZ/O9oGupbLoJ0jMla0aw4pYzKOvLnbbtQ7C
o9OohYCzXReBpix68RLSWMMMDTLBf9p0KuU5o1BoFwH9sgqOuuweD7ledqcRPs9s
HvlwOZ3QBPQM14Kz8BlcOfY7uAqY+rcaiRTMLDuX9vkjj1mnXPJsTBXL5NgLR793
TmB7KNA3t7aLRFwSUZodD7zaJEgkPdy8N+uTj4c/N4Ty53Dn+srEUweG2LXCC2SX
IkFzrgkra+AHrEnP1lzhag2eJ9zxCPKGxDsrRQj2PKQFetvVlk4NiVysCqH1LHi8
1OZ2LqklZKyuEO1+YMjDzUYhbmlzRClk+oZ4oyLnERTyx7l9DbUO4TktEoVl3hSr
riKBa8sCAchwkeA1tzkGu65mb2nX5LlJ9AZ+c5jEkzU+Rj8TfYfnaJX8FpuPfQ=3D=3D
=3D0BTb
-----END PGP PUBLIC KEY BLOCK-----

--------------I1034yLSgdusPEf8xlfDkfBX--

--------------CWtrGXdNxPwn0aOPzmgT6zW3--

--------------7l0zI1gVkgNMPsdLvfjxdyrG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE13oJz+7cK71TpwR0YAI/xNNJIHIFAmKhJoIACgkQYAI/xNNJ
IHK7GBAAzyF0UW3CNF3/bg7c17ySkfc08mP6ht0XcmAM5wqWiy/LeZTbQjixe58p
/tpmH/UD/2SZjKbpb+KGypXbiITofxau7+gpmwwH75Y+OGRMVg02H/8E7A09/4FZ
J/gG5E6VV3cA2fGEvXw+YfczoQHU+uSqtl8y9eChzEg+P7MlBXGjouuZL3MyR9xn
mbc2o3YdSfscaXcoEm6Qas3cG9hAoLGMxD3NiebRFI0WkQ0o0Yrx158svgta91hw
YQKzNsil/7r3aCaCd3gAbRjq+kOJHdwxKBIiwItb/NA0YTFKooXNmWz4lF27+LE6
m9ymR9XTRtTiiY5ZoOjlsgNuXxRJrqHB0o3qMSVqaggncZorRk/NMDrVYhUg4VJ5
ndcvD7IqL2XcfsuB5Z2Wk1Piu0V5FKjmTDQ6HTITScInAMPnFrXJIteOM0h4tUif
Lv2moGgaPvruWG1KvgFhwygAoX74EJnFNANitsQZs+0JF4qnuVbIxhckFImNkFiq
gxmcxmOBaXBpAQe8cuGowIQRWXdmVKoL1w+34JIsSwB+Vpqa/2CYC3kobIt9DgNp
ZI0dd3YIJoBoW4bU+oWo1TkSOCS5fECdvLFRWu3g/Srlp76//C1yLrGy1BF9GE6j
b4jFPuUaKcPdMGoqthbpxk/0xbjbaehV/u2FIbM+ceRN5+Ud+yQ=
=5Wjk
-----END PGP SIGNATURE-----

--------------7l0zI1gVkgNMPsdLvfjxdyrG--
