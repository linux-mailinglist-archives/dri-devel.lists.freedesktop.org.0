Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D67E84F9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 22:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93D310E29B;
	Fri, 10 Nov 2023 21:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8393C10E29B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 21:10:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40837124e1cso14545e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 13:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699650604; x=1700255404;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XE+/jbgSi664HD8BrCmT+2A639BdbZR0PFQ8SEUbr8E=;
 b=yxNsM8fbYEopPlzFAyW4lvlP+NAkJaRtKSE6qAm7o/yBB1LWF6i1qoKAT/lBapJHM0
 pNWDHof7gZRGIKb4gru6z4eNqDXRt2y/E5zEk5zijVnOaiHa0Fe0Gg7wrVpS5E15T0Kn
 Q63+9j6qgl9C3+W9uK0I5nUD53fvQijPP2Dz75h1Xct8aTAHj5hDXm62FRi03fni2FIa
 wJ0asnK/nAJqF3qXcz0ctBHPpxE7kPHnK8TQvzofE2I+qNoy6H1flFnzA4g6Z7k1SJlX
 BFmo1AYr6TXkmYFnUZZVAn/t1zFbOVirH1KXu9Rgl2iotREzcOzUY6mGq6pmoDoeC7oA
 FseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699650604; x=1700255404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XE+/jbgSi664HD8BrCmT+2A639BdbZR0PFQ8SEUbr8E=;
 b=RlOBJRtY/Zt1ynyNgZcY3tzFHICiJ9fGCDtZ+S3z6aR1qbzV2/Ihz1IXxemAqvtqba
 1BWwlyTruKIJ0NfDUEp29/pg1TUscalZ8i4ZKsFDPA+JbIiN99n2hHNgycBztU0kfpSL
 Rh+p37883XHuJforyXAw/YHl49HYMBZ7yzahIKqT7a8+fJLKDEFreWpG5TfEvMVaUKDF
 qjy62DLh1M5mxz1bZh+PmyY0yogMk55/JTe2W5tp1299o8IS1sa25TjXkntbt1Y19QuD
 KTvJguhsRq4y51mkTkqfvjm4Q+Vmk/mWPd1dA5qLK/4zKSOL0kHTs87Pw9BIV7S15Cr7
 SLEg==
X-Gm-Message-State: AOJu0Yy0iSBZfUGAjRsH+2f/UbUAQDMMCU/rohtj3uJ8i71enmZC4dzf
 IyvmZX1USjyWX3iC4Y/zxEFR1l5bxWrRbP8S6cSDSg==
X-Google-Smtp-Source: AGHT+IEed6ru5XI2tGdQUHFtZARACGAfGFOcCru3M+E5sMSccnmdruAaJQRKVBsgXLem9FOe09lBfdh00h+15HeH9/0=
X-Received: by 2002:a05:600c:3b9b:b0:408:3725:b96a with SMTP id
 n27-20020a05600c3b9b00b004083725b96amr9766wms.0.1699650603630; Fri, 10 Nov
 2023 13:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20231110094553.2361842-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231110094553.2361842-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 10 Nov 2023 13:09:46 -0800
Message-ID: <CAD=FV=UvZ9U1SYjOOBB6o2CmquAevqJZ9Ukp_kx4zGXFbp_VBA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, zhouruihai@huaqin.com,
 devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 10, 2023 at 1:46=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The refresh reported by modotest is 60.46Hz, and the actual measurement

s/modotets/modetest/

> is 60.01Hz, which is outside the expected tolerance. Adjust hporch and
> pixel clock to fix it. After repair, modetest and actual measurement were
> all 60.01Hz.

Can you explain this more? Why was the rate that modetest reported
different from the actual measured rate? This feels like it's a
problem with your MIPI controller not being able to accurately make
the rate. Is that it?

If so then this is a bit of a hack. Someone else using the same panel
might have a MIPI controller that can make slightly different clock
rates. I think you're currently the only user of the panel, so maybe
this isn't too terrible (would love to hear other people's advice).

Assuming this is actually the problem there are probably at least
several different ways to solve this. One that comes to mind is the
solution we ended up with for eDP where we allowed specifying some of
this stuff in the device tree, though that might cause a whole pile of
debates...

In any case, as I said above this patch is probably OK if you're the
only user of this panel, but it might be at least good to add
something to the commit message?

-Doug
