Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63742FDD5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC026E3F5;
	Fri, 15 Oct 2021 22:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3846E3F5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:07:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z20so43454318edc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfrvNfe8cIeMC9VL0sueBqNC1Hm+TJOvlEdZe3LO7Ak=;
 b=HNDT+KKahn+9l5vdegEbLOmNFbvNFNqWXYAWDhkbdEYMUNc/sEM2zBM8ujgmkt1WGl
 89NRQPZhMD0ctuXGU+8CRvEOVew/tfir7xFaWIqc2xhSIfMJPuYg/Rc+oJgAZkwB9RSh
 cvYnyZyiFRKlO0rHaZE4k4T7gLLCYxPKSgo0SPJkOyNiVvCeCZtmQLqhYDHKmwI9J/XI
 QeNxx0vJwHyqLuH+RviME2mk+XJeLWPHpbSN6vlCFOd0qPtapsGeZxChswmdFOZA1nRZ
 4iPeHmBImFeWi4y82OqUmHN9vBxXPWimcGeQazGafKvDJnqZUi9yVQCgTQSULTqVjqzy
 Tr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfrvNfe8cIeMC9VL0sueBqNC1Hm+TJOvlEdZe3LO7Ak=;
 b=xE4vuKfeI7X6bu80hiI00icHdWHT4nprCr/alr4lggzx9th2FEDJPfaCdPd8soNgeD
 gNSHeu56wE6jnve2RubawyuEgApjyFVRDrojtgfX5qy6Gt0GiMLPaDh5HPW5YeowEdoj
 a71l3nlxLFTUGlgAGPkT67FEopQFMjz/cyOfaDgexoMO220dRquHPk9NmtiQ01i7vePE
 lOWXUoxhHQX2ieFWVeCyIXZoAFvfXxplRk8gUmU85KDRmi5mzWbq+RjkSxEuvKTMLsb6
 0uVlufcqAkEp5S0u4kPF4uFetseKwijM76jCr40EUG6ZAnqQcrf/duwvOzvyRJZQARgE
 XGnw==
X-Gm-Message-State: AOAM530g0ru4NA33kwtP+qI26MS4fbjGMzBxp7sKbLbjb0osniFHLJ4o
 R7rDHLTc+xfAbChzM7011m8kqQd41NQu3Cs/1bs=
X-Google-Smtp-Source: ABdhPJyiA3feuV5RcRuc8R/2D8DhxlO3N51TUr3uX065PKdazoD72Wacb3BIrg/vh2ntU3s9aLA26Fsrl3E/ZH+5MRk=
X-Received: by 2002:a05:6402:3186:: with SMTP id
 di6mr20882798edb.225.1634335662519; 
 Fri, 15 Oct 2021 15:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-6-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:07:31 +0200
Message-ID: <CAFBinCAqA1s--b-iUYe_Wx+rVU56uiMybe2kYSxYOZUXtOt6jA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/meson: rename venc_cvbs to encoder_cvbs
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Rename the cvbs encoder to match the newly introduced meson_encoder_hdmi.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
