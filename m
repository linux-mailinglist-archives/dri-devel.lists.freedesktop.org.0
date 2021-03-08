Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E033149F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 18:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB2489E57;
	Mon,  8 Mar 2021 17:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895B389E57
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 17:23:22 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id a7so10723958iok.12
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 09:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t87CCa35bqPyH+5rtehXh9/9TmKJVxVWgeAklXE4G9w=;
 b=RUySloQZ1a3rA68cQHDUGRXs5+SWWj7DFvyTIxIaUjUJibkRbJ8Q7Nkmi0T+oc2U6z
 WeKEaey0k9X7a6a3YQAda1UobhADiiRGoilaHnqYPjQUVe1v1NsrC2kzOlm+Ekkw4SJu
 PVpxTpCokRvn/hbmV+TE/IULF/DDnJlMx+19eI6bEJv5IA4LCAVlv/jxmEzUxDAHvs8A
 BFFA0DtPKldTQz69Kaa8Ey7Mr5hKzj7DL/N5qLEFPQSRfaLIUMQUuyt8aHvkBdgaRN3U
 +CjJ1doZ9laEySEhuOn6NtuordypwRtir1/oSH4gxX+hWTmMMaS4BL/JQ7gwaSSeb6je
 zGhA==
X-Gm-Message-State: AOAM532XgAqGvPiybDFTQmn6Lb0Ts3WklDakIkvZsR9K013W2y5yi4Wr
 19HhECsSikXszBbxTp6LVQ==
X-Google-Smtp-Source: ABdhPJwWpjx/LAtFOUHhB6Mb5nbd8qSM0nlIGMyripcZWJpKoFzXah9JI1UE8tDmOeBEHk/3qrkLSQ==
X-Received: by 2002:a6b:c997:: with SMTP id z145mr18975688iof.36.1615224201004; 
 Mon, 08 Mar 2021 09:23:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x2sm6479656ilj.31.2021.03.08.09.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:23:20 -0800 (PST)
Received: (nullmailer pid 2657444 invoked by uid 1000);
 Mon, 08 Mar 2021 17:23:16 -0000
Date: Mon, 8 Mar 2021 10:23:16 -0700
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: qcom-wled: Add PMI8994
 compatible
Message-ID: <20210308172316.GA2657398@robh.at.kernel.org>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Feb 2021 13:41:04 +0100, Konrad Dybcio wrote:
> Document the newly added PMI8994 compatible.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
