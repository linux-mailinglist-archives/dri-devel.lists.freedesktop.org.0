Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBA912F9CB
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 16:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6A86E062;
	Fri,  3 Jan 2020 15:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67EE6E062
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 15:30:50 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so41868343edb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 07:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ByAdBB1G/PoGRjeTtrFxzGAEpeGoWNuIbHWkC7xwGOE=;
 b=JFDmGD4Vpd8WcCrsLUNzP4/QNPt1tmgt6v9JWOInXa6/4IBUaBh7vc8NjFShc1E3GJ
 1EE4QQ3JOlGDaoPNc72hV00cbmz3YPPE+3etBe7QGAfNGjIGz80PdngUBgg4EM5nVY77
 gxSa+jsbeygecqikXrakVvznLi5WhNn5ilfTg9uJT27/LTQrM0B7NyzB55VlkuN9F7Ds
 wwLxr6dq+8GNRqWN9RrOLz0dVQI2y8Tq32LrnYHDqQJANVa0jdd4N9SgQ2+4m3mr7SFf
 gD97ElpTWOAXP87PF3qaWNK9DcRw3TqcheViHm2TGzCn+Gva+te0Ad2HrTKtKFpD1QAi
 HDAg==
X-Gm-Message-State: APjAAAU7d9GZ4ZtacrIruVm7yE8EJ2YWRaCtDaOrRV2sVPlpzWM6c+Qn
 0bkp05WocIlWIjTMqYI6OOOL8obYRI0=
X-Google-Smtp-Source: APXvYqy3h7ObsxXpKFvXKqoawoUcuOkA15wm5F32O/QR4qHUBG4IqRABcrKGJgClge6CBChV6m/p8w==
X-Received: by 2002:aa7:d285:: with SMTP id w5mr91462964edq.246.1578065448703; 
 Fri, 03 Jan 2020 07:30:48 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id p17sm7627704ejb.84.2020.01.03.07.30.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 07:30:48 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id q9so8702918wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 07:30:47 -0800 (PST)
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr20513346wmg.110.1578065447558; 
 Fri, 03 Jan 2020 07:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20200103152801.47254-1-maxime@cerno.tech>
 <20200103152801.47254-3-maxime@cerno.tech>
In-Reply-To: <20200103152801.47254-3-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 3 Jan 2020 23:30:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v662mJCGaRx_-0ij9inTGz1GtzNxkFyBeeq2hhbSYZm3Rg@mail.gmail.com>
Message-ID: <CAGb2v662mJCGaRx_-0ij9inTGz1GtzNxkFyBeeq2hhbSYZm3Rg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clk: sunxi: a23/a33: Export the MIPI PLL
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 3, 2020 at 11:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The MIPI PLL is used for LVDS. Make sure it's exported in the dt bindings
> headers.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
