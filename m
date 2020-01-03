Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F7612F9C9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 16:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051FA6E051;
	Fri,  3 Jan 2020 15:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87176E051
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 15:30:28 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e10so41901604edv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 07:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ByAdBB1G/PoGRjeTtrFxzGAEpeGoWNuIbHWkC7xwGOE=;
 b=tJrkBoCQKYhpTZrfQQlqyKdKaKwaxbqEFUkis0r10QBH//mJdIP+W4nECT/QOuY2gq
 w9Krl4ap35PW2W1AbfI8dJjgSzl9Nk3zsJwh9N8dmCwnYM3tX7NhjPiKP9h8SLznOkZb
 BiR/XzXf1frwlfIOP/bAOlyyYCEjdGNvhAJ2wJ+M7m7R/K7KscXs8V+l2BKR6NzCPq4V
 BpVQmmm2SGN8BItKUyVou+kADmTlimIuRpsJxSTuAG5FNUx39+bW8VnrdybRzfEm+doY
 RW+9+3Wh3xlZVaCNP0Vh+X0+u3+fFGpkwkiBX56G+dTRWEWFZ8BoNWAoUeZbpMMWIqMY
 oXjQ==
X-Gm-Message-State: APjAAAXU6HL4M4BxNtcvHL18tKVBuuaYkxiOBPfzU8AS29rEjXbaAuae
 6JFMq3hAai+/8c3bmJ9JS/PFQo3bYCI=
X-Google-Smtp-Source: APXvYqz9mQwqQ4Yex6DWWlDfix9HkpUoU5x022l1OvWboEE6NkMbusHl72mKXOhsxcwfFcEO4rLBLQ==
X-Received: by 2002:aa7:d3c3:: with SMTP id o3mr93030107edr.167.1578065425712; 
 Fri, 03 Jan 2020 07:30:25 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id d8sm7129713edn.52.2020.01.03.07.30.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 07:30:25 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id p9so8719466wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 07:30:25 -0800 (PST)
X-Received: by 2002:a05:600c:2409:: with SMTP id
 9mr18988080wmp.109.1578065424941; 
 Fri, 03 Jan 2020 07:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20200103152801.47254-1-maxime@cerno.tech>
 <20200103152801.47254-2-maxime@cerno.tech>
In-Reply-To: <20200103152801.47254-2-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 3 Jan 2020 23:30:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v679hRb+068xcA7DvnwYjp1V9MP9rOWWy_MqXwAG1_d_Zw@mail.gmail.com>
Message-ID: <CAGb2v679hRb+068xcA7DvnwYjp1V9MP9rOWWy_MqXwAG1_d_Zw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: sunxi: a31: Export the MIPI PLL
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
