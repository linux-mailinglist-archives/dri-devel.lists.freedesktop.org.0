Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D2734473A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFF689C17;
	Mon, 22 Mar 2021 14:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99D389C17
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:32:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id h13so19614797eds.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3wwIqyFPHe6ZAKN+LQ8aSD2WsQvVe4v3ne6hGNoA8C4=;
 b=hA5oQoveXMlhWrgA8Hwy01ZJscuFMTPCkjgY9bJrq197tAVgKwWhvP34pKDwKMQ5YV
 oAZJW22xc+YGeiTziTWlssZKTzNPpoWfRmz03Y6sgpZJviat/LAmT7Qe+7OH33Q0rS5C
 wpyocBmdI0KEyglXetRyuQDMM0qlLqeM4ciKVPZle5ebhkrDINyF+cGg7UsTLMB0poFe
 GitpNP67bHlUwlMBMcfYWv52+6G04CMyp9crmgyEx6nKfhvaoun0sh/QjSOzNIWG6HLE
 k0zYJi2FoS6mN/fWxKjIvuiSWtwTjJOBZ3D81AjzOV7wEPgjBCoh0sGr9/PHZa8jehPS
 JVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3wwIqyFPHe6ZAKN+LQ8aSD2WsQvVe4v3ne6hGNoA8C4=;
 b=KToUIjav1lI1vnTTyebSWtNaLFvDICDsghygkiVMf/df5UE+n7wbXP+4GzmkgwFX9E
 R2LOzqMgK7hW/i+XoYBEmUJAo8/ZN2GqL8/L6TKltLxPBEZZd64weupt0LKDahzEo2IP
 rwj01Px0eqBYJwcnhgwIjEPtmxXqdt2i7EXUzwauiK63yMRMT0qBjqU0nhykaexFzGX7
 Z8dmteAuiukqvvcA1c9XM5MUxd5SAOXvxbBODoYk7V/ATt+HdZWKIrkTbImfypS5Ev5W
 rH+ddTFzjkU8xosMTaYkPhyiejno8MSERZFg6/SvKhr67lN0tEcZ9/2zHuTxq6TVsoD8
 O/Nw==
X-Gm-Message-State: AOAM532omK/f87bllNbA1NMcDV3xGaSKikfEeN49026VASXpo1yTuln+
 5VbbOudZRwxNJeXEbPL0zQ0iOw==
X-Google-Smtp-Source: ABdhPJxrD01ox8FQeMIKunrADMgF+Sd0g84M02e89p7iOPIQ0Xkyz0WQ1/EbAUpHFlRedCH25eE44A==
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr25918253edd.48.1616423551518; 
 Mon, 22 Mar 2021 07:32:31 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id p19sm11573830edr.57.2021.03.22.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:32:31 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:32:29 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Add Kinetic KTD259 bindings
Message-ID: <20210322143229.GQ2916463@dell>
References: <20210321114341.944696-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321114341.944696-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMSBNYXIgMjAyMSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIEtURDI1OSBp
cyBqdXN0IGEgbmV3ZXIgdmVyc2lvbiBvZiB0aGUgS1REMjUzIGFuZCB3b3Jrcwo+IGFsbCB0aGUg
c2FtZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9raW5ldGljLGt0
ZDI1My55YW1sICAgICAgICAgIHwgOSArKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9u
ZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2Vz
CkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
