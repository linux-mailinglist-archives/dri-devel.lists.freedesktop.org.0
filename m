Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFDD34473F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FC989CCE;
	Mon, 22 Mar 2021 14:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6840C89CCE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:32:49 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kt15so12155863ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dJjMrbtRe4w1srPs85N00Mj3uzhVcVuVBxa7CuR9tBk=;
 b=F/z3WvUoeostIK+7llMc6EFWXbbyRkOZF1pWjknHXcu4tDjme6yMuFN72Atn603qXP
 UvdmZypZhUehammr/xQXST7zWaDsNFAJiKnJbNoAzFL6hYsvRReyC6Z5/tJDD25iZz+H
 jKrSdGDc+aPc5jGu4SL4PbPVS7nSvdjOpRjFucCCtNIMlrPUs6uH+iwAC/kahY+ChCF3
 vmUg3AKCIgadN1dg6ZaIMN2elWbeTDYk2PsxzkQEdXblEdPplTXnmvE3PA7KZanv2th6
 ppeEOXZ4C9A9ZY1m6ryR4Z3W412WKiei099DwAPUbek9pz5tg8dEIe66ziZx0Tsgom1S
 ZhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dJjMrbtRe4w1srPs85N00Mj3uzhVcVuVBxa7CuR9tBk=;
 b=VyKRcXRhsN3DqCn+l+QP/Mp0tFZeFKkHecwdEvU1l23AW9lXTMmcarz/1pQ/oKc1Db
 P7dm7JixQhSTODU2aXnn6rYO2SNk5RpqShLUfcCx+GTlqoUyfB0bLB4fADu/fN2sQNVn
 vyCploys0Pu29Zn7o356qr+lTE1YtzcFw/gpWNDVNdie0/Nv4JQ/Ciol/dqL/PVC/HHQ
 +BAf6vtJlfxcf3BNi+fci4hraQU7htUK9u6/feP3g6JDerp+9RX7wNZQXqDAqDZMjxmM
 YMkyHVa4D8DmgopEhT0UNwqpkTrxXD/479Yb3rkabEdj9sgSm2eRIBlCbf+xcM4gSQa5
 uILQ==
X-Gm-Message-State: AOAM533C4mz+MFDG5GPQN6MCf/Ta1MJpO64dcLLKNgyEaaX/0BLyBHm/
 VzWoifXohq+4ctINpxGUIMbMzg==
X-Google-Smtp-Source: ABdhPJw6oSMHLnBM8JPcs7tyOF4VHo4Cxl+cMVwh+TC1mfMaFofcWjpINDbhSaQjrJCds5VgaRIK8g==
X-Received: by 2002:a17:906:38da:: with SMTP id r26mr3406ejd.251.1616423568136; 
 Mon, 22 Mar 2021 07:32:48 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id l10sm11547348edr.87.2021.03.22.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:32:47 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:32:46 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] backlight: ktd253: Support KTD259
Message-ID: <20210322143246.GR2916463@dell>
References: <20210321114341.944696-1-linus.walleij@linaro.org>
 <20210321114341.944696-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321114341.944696-2-linus.walleij@linaro.org>
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

T24gU3VuLCAyMSBNYXIgMjAyMSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIEtURDI1OSB3
b3JrcyBqdXN0IGxpa2UgS1REMjUzIHNvIGFkZCB0aGlzIGNvbXBhdGlibGUKPiB0byB0aGUgZHJp
dmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQva3RkMjUzLWJhY2tsaWdo
dC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQXBwbGllZCwgdGhh
bmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBE
ZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
