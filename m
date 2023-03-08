Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46846AFB6F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 01:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3177510E57F;
	Wed,  8 Mar 2023 00:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894C810E57F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 00:45:45 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 130so8733666pgg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 16:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678236345;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=D0ax2sgEUzQvZjIaGlw0Pyd5UALWxKyMm5VBST2yrms=;
 b=S6zpXba3J9uT8dvc2HWZijtfHcp2L7rJl2Ast5TkGZ8YVO/H6ll3ykNJjFHJsXnqux
 ei6hh093Jk8HfmQwlRBUr7zzRDjo7T56wfbTsVrbwEpu55KtMBquJw7KWq8ZyLnNk2IN
 /Hz0Uh9ce7j7kIf9FpHj4n2rpx7xJ9fYs75zCggSHD9pORo5XLVatbqSYvLThpz9i33j
 +C2p5tIT3PGUOu7YHiNjtX6R0x8BCYDjSWowJvKqk8BP6Fd82fTSP69ESk2W8p3UNCpK
 5wJCySoPBNXgQpKgvLVxMGxPKBfNTgBgrNVJjC40b7MS43p/nbppitfdNEdFglU6i6K+
 +4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678236345;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0ax2sgEUzQvZjIaGlw0Pyd5UALWxKyMm5VBST2yrms=;
 b=Zv3PhhD511JNO/tho3qe50S5/Ncw34j4Q2b5pszeRJOLUSIiXTkys/azUI1XzW4fRj
 ak0GK/UFEpONpr3XtBQ7hv7tN/wmQCI3pNz3TmlBPeHiePmbazp3ySBJvxx4BLQ9hTDV
 OkLWzp9NsAFxze8erGqYcwWymLypvJ2snHs+EhCeCVZvjvqGdOUl188vfyxjbem5sosO
 6XCKE1OeJyCAM9mwsj5tGT67huB3hdZZZ9/yflT5Zq9lCW0GGwE/Ccg1dgev5biJV2A5
 0O5Pi0YEiJ9V5PJBbGGQAAHY8cTainfi0B5FiBS3+SmzQHc6c/A4vbjYg8hDtmgKPtV4
 KxcQ==
X-Gm-Message-State: AO0yUKUa/VvfoSQe7RlfRSfNWJtKuj/IadSokMG/Fay6dRLoC0TS9jTU
 MhA0FBaiSDdTqn21f2eKxMM=
X-Google-Smtp-Source: AK7set/rVZxSWwprvQ/WvKDRZWKKzRf3KDO7wMLtXsnaYD8WLoki0emzW55feMtlyajY9GwzZAtmPQ==
X-Received: by 2002:a62:1741:0:b0:5b9:49a5:5ddc with SMTP id
 62-20020a621741000000b005b949a55ddcmr14301856pfx.3.1678236345021; 
 Tue, 07 Mar 2023 16:45:45 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm8345765pfp.46.2023.03.07.16.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 16:45:44 -0800 (PST)
Date: Wed, 8 Mar 2023 08:45:37 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for Novatek NT36523
Message-ID: <ZAfasb9aKTgyjbFc@Gentoo>
References: <20230220121258.10727-1-lujianhua000@gmail.com>
 <20230220121258.10727-2-lujianhua000@gmail.com>
 <CACRpkdbZCZiMM_qeqMd9=txVvPVHEzM4szOnPR-gCYdiXW_9eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbZCZiMM_qeqMd9=txVvPVHEzM4szOnPR-gCYdiXW_9eA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:34:55PM +0100, Linus Walleij wrote:
> Hi Jianhua,
> 
> thanks for your patch!
> 
> It appears Konrad is working on a very similar driver, so I suggest merging
> them into one Novatek NT36523 driver.
> 
> Possibly we can fix this up first and then add Konrads Lenovo-panel with
> a patch on top.
> 
> On Mon, Feb 20, 2023 at 1:13 PM Jianhua Lu <lujianhua000@gmail.com> wrote:
> 
> > Add a driver for panels using the Novatek NT36523 display driver IC.
> >
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> 
> (...)
> 
> I like how you abstract the panel with init commands in the panel info.
> 
> > +enum dsi_cmd_type {
> > +       INIT_DCS_CMD,
> > +       DELAY_CMD,
> > +};
> > +
> > +struct panel_init_cmd {
> > +       enum dsi_cmd_type type;
> > +       size_t len;
> > +       const char *data;
> > +};
> > +
> > +#define _INIT_DCS_CMD(...) { \
> > +       .type = INIT_DCS_CMD, \
> > +       .len = sizeof((char[]){__VA_ARGS__}), \
> > +       .data = (char[]){__VA_ARGS__} }
> > +
> > +#define _INIT_DELAY_CMD(...) { \
> > +       .type = DELAY_CMD,\
> > +       .len = sizeof((char[]){__VA_ARGS__}), \
> > +       .data = (char[]){__VA_ARGS__} }
> 
> I have seen this type of reinvented wheels a few times now. Don't do this.
> 
> Look into other recently merged drivers and look how they do it, for example
> drivers/gpu/drm/panel/panel-himax-hx8394.c
> 
> For example:
> 
> - Use mipi_dsi_dcs_write_seq()
> 
> - If the delay is just used at one point in the sequence, do not invent
>   a command language like above for it, open code the delay instead
> 
> - Try to decode as much magic as possible, if you look in Konrads
>   driver you clearly see some standard MIPI commands, I bet you have
>   some too.
> 
> - Maybe use callbacks to send sequences instead of tables, like in
>   the himax driver?
Maybe I should create a wrapper of mipi_dsi_dcs_write_seq() for sync dual dsi mode.
> 
> Other than that it seems like something that could also handle the Lenovo
> display, or the other way around, I don't know which driver is the best
> starting point, but this one has the right Novatek name at least.
> 
> Yours,
> Linus Walleij
