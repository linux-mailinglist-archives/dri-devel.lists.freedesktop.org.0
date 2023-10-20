Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898A97D0E2B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 13:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0576610E59A;
	Fri, 20 Oct 2023 11:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D19410E59A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 11:11:34 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d9abc069c8bso664984276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 04:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697800293; x=1698405093; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=238BGF/tc90S5r9KIjhwqf0Ln5fMccNmQ3YyMRe3cHM=;
 b=pwXwYmWG1Lr8uB/PUsvwnUu10KEUyXPrjSYW+yaqZv0zIjHHoBn5vbXffD/Qp7/Rpn
 Mmli169ziBLoAuvi7QJdlDdXRzYzmJRrZIRZqElb0pShK+eKh2fgPJQkb77cWhW07D9W
 NyUehfEBA334EEi3ZMOsxjpzQxILVMonfWJr+LWAGBPZ8Mj024AWry2I2TcN92wO2+jE
 tv+FReI7v8mUipAX0ZwP89bkGqcEsxAIOE41+nsrw0tlx2/3YU4qlTxrwFLAIGRQHrtp
 5tS0/9JzI/zSioPDeA5saYYwoHEA4oQLY1eMpqPyRRO+7HmwIBG5YsMziEY5qDagxcRN
 BAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697800293; x=1698405093;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=238BGF/tc90S5r9KIjhwqf0Ln5fMccNmQ3YyMRe3cHM=;
 b=VmBaf2n7jpjTfxFo9YhZVAY7BcSWnAcyS3CQObod92gnMnJUCYQVkiyLOFEosEICsX
 MEOon7UEmqT3DNZMREEyIbGkdK65V1V9+53O5iqpDCbn4GLw6eBzTCVo31iYRpdH/r9S
 jM/TIGaYEFuhmPe0f41BM8vGtOKpu8zqHdZayHGgofri56QsPfDyZ3TPc99+4N/xCoMi
 nuuhgqfV/2EblBWme8cBLyoaVEj7LC4gnb0jhAA/5mDxsc5e55CheFwe/umsLvUBb+kR
 kguxJB8et0qbjOHAussUu+PNDo/XX6Dx+V4t3Izy1mjrfvsV4Xl1eg0mNCaEs+UHGmo6
 tzLg==
X-Gm-Message-State: AOJu0YwNvX9QWN8Gtig25Tv+HC06SQdMZ+9t2BZQBYajySzJhgMdsaFT
 CMkRDwIEHMiXM5YZLYVjVO72ta416DZAwyXpFfgSAQ==
X-Google-Smtp-Source: AGHT+IHrTRBukRUSX+tX4qVyHMfQ0ol4wLNSh8CW2fcwseZZ9etXJsyey59rz+FklqB+EOylNKE9GnrwX/uU3HCDcEE=
X-Received: by 2002:a25:acd4:0:b0:d9a:5f91:c615 with SMTP id
 x20-20020a25acd4000000b00d9a5f91c615mr1338698ybd.18.1697800293306; Fri, 20
 Oct 2023 04:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
 <20231013091844.804310-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231013091844.804310-2-yangcong5@huaqin.corp-partner.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2023 13:11:21 +0200
Message-ID: <CACRpkdb93nGB=Owx9k6KepAVd_n=TgD5BHSZvuRv4+RGAs1CFw@mail.gmail.com>
Subject: Re: [v4 1/3] drm/panel: ili9882t: Break out as separate driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: neil.armstrong@linaro.org, Douglas Anderson <dianders@chromium.org>,
 will@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, catalin.marinas@arm.com,
 hsinyi@google.com, dianders@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cong, Doug,

thanks for fixing this up, I'm very pleased with how it turned out.

Yours,
Linus Walleij
