Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B71C4E94
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1656E51B;
	Tue,  5 May 2020 06:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5536C890D4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 20:01:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r26so920484wmh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 13:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEW76UZB/sZtEFwmy764PGyYDv4AC7eZ6iGbT8XBec0=;
 b=J2SSEBYc/WoxujpQAS2W/xAgYPgfa8Gz1OkN083PUPlkb0CDiWh627fuYKmGJ5bc3w
 +QdwvO/51msDiu0IfKR4ndHu9IiwtIq7teOW3p5tSI2WbuWKna2mJl1fQlKjz17ZZmF3
 THlGeaChnbRvKAI7Q8QqOe6ae4HYWTSDS/PMA0S89z+aAX1yR+AlkEIij2kCtLSV0z42
 7opNx8ys/Zhqc8h2pQ/n5P++unPQUydbBgHCFSlkqrrWrToPlELa4up+xC9Jgofwi+3b
 Wnh8BmjFnMX4xlKwfTVxFbivZJAElzBraWM8WSSaZ9orVoqqUuWa4Z2KjFoJFVf53DKf
 tveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEW76UZB/sZtEFwmy764PGyYDv4AC7eZ6iGbT8XBec0=;
 b=XOxtI8QMuhycfZqvSIPkUAW2DbpqCjGP0YKZab5br8FWAL0u3kY5heUmhIy2fI7d3Y
 M5/kQQ88SpIFYw7WOJnIwmHOsy12CJC85OIamcDtnPHatHMHvh0ETrYsdr5pO3TD3CL1
 ayIa/cGPbxQXfM8Qz7mzY+7NeDgLb46AvMh49Plh/SN7B45Poxht7PBbkS1elfSbLDt0
 Eq7wr5jOsB8g2DAZUmS/ERYfJgwUjVdeOhll9gTMBQzwBGmeZ7HuCNO/nduwCivw8iA8
 EToPCC/acRMDK/9bo035cGTQ38vlZbm+y1JHPqzrmWCVPdkh9JQBOa8/s6RLoy+870fz
 RGxw==
X-Gm-Message-State: AGi0PuYyjAoOfN1h4StbgG6OO0K/d2t178PA7ezvrJ+iEkm8VnEQaP1o
 jNUNZp22Eezj7Tkuoc7khN0=
X-Google-Smtp-Source: APiQypLcSw0pOqEp8W828P4UsPw9yMNrnI+r6qNGKRZbiBZZ1S7x++V+QiE1tOHTdDZ2VFwHokZlbA==
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr16607050wmt.153.1588622479996; 
 Mon, 04 May 2020 13:01:19 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id s17sm739252wmc.48.2020.05.04.13.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 13:01:19 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: 
Subject: [v3 PATCH 2/2] dt-bindings: display: Document ASUS Z00T TM5P5 NT35596
 panel compatible
Date: Mon,  4 May 2020 22:01:00 +0200
Message-Id: <20200504200102.129195-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200504200102.129195-1-konradybcio@gmail.com>
References: <20200504200102.129195-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkeWJjaW9AZ21haWwuY29tPgotLS0K
IC4uLi9kaXNwbGF5L3BhbmVsL2FzdXMsejAwdC10bTVwNS1uMzU1OTYueWFtbCB8IDU2ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvYXN1cyx6MDB0LXRtNXA1LW4zNTU5Ni55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYXN1cyx6MDB0LXRtNXA1LW4zNTU5
Ni55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
YXN1cyx6MDB0LXRtNXA1LW4zNTU5Ni55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMDAuLmFhODk0MGU0OTNlYjEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9hc3VzLHowMHQtdG01cDUtbjM1
NTk2LnlhbWwKQEAgLTAsMCArMSw1NiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3RtNXA1LG50MzU1OTYueWFtbCMK
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwor
Cit0aXRsZTogQVNVUyBaMDBUIFRNNVA1IE5UMzU1OTYgNS41IiAxMDgww5cxOTIwIExDRCBQYW5l
bAorCittYWludGFpbmVyczoKKyAgLSBLb25yYWQgRHliY2lvIDxrb25yYWR5YmNpb0BnbWFpbC5j
b20+CisKK2Rlc2NyaXB0aW9uOiB8KworICBUaGlzIHBhbmVsIHNlZW1zIHRvIG9ubHkgYmUgZm91
bmQgaW4gdGhlIEFzdXMgWjAwVAorICBzbWFydHBob25lIGFuZCB3ZSBoYXZlIG5vIHN0cmFpZ2h0
Zm9yd2FyZCB3YXkgb2YKKyAgYWN0dWFsbHkgZ2V0dGluZyB0aGUgY29ycmVjdCBtb2RlbCBudW1i
ZXIsCisgIGFzIG5vIHNjaGVtYXRpY3MgYXJlIHJlbGVhc2VkIHB1YmxpY2x5LgorCithbGxPZjoK
KyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJs
ZToKKyAgICBjb25zdDogYXN1cyx6MDB0LXRtNXA1LW4zNTU5NgorICByZWc6IHRydWUKKyAgcmVz
ZXQtZ3Bpb3M6IHRydWUKKyAgdmRkLXN1cHBseToKKyAgICAgZGVzY3JpcHRpb246IGNvcmUgdm9s
dGFnZSBzdXBwbHkKKyAgdmRkaW8tc3VwcGx5OgorICAgICBkZXNjcmlwdGlvbjogdmRkaW8gc3Vw
cGx5CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSB2ZGQtc3VwcGx5
CisgIC0gdmRkaW8tc3VwcGx5CisgIC0gcmVzZXQtZ3Bpb3MKKworYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Z3Bpby9ncGlvLmg+CisKKyAgICBkc2kgeworICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKKyAgICAgICAgICAgIHBhbmVsQDAg
eworICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47CisKKyAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJhc3VzLHowMHQtdG01cDUtbjM1NTk2IjsKKworICAgICAgICAgICAgICAg
ICAgICB2ZGQtc3VwcGx5ID0gPCZwbTg5MTZfbDg+OworICAgICAgICAgICAgICAgICAgICB2ZGRp
by1zdXBwbHkgPSA8JnBtODkxNl9sNj47CisgICAgICAgICAgICAgICAgICAgIHJlc2V0LWdwaW9z
ID0gPCZtc21ncGlvIDI1IEdQSU9fQUNUSVZFX0hJR0g+OworICAgICAgICAgICAgfTsKKyAgICB9
OwotLSAKMi4yNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
