Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC67132CF9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 18:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1D76E11F;
	Tue,  7 Jan 2020 17:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7B36E11F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 17:28:47 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id dc19so229920edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 09:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JccRlX/oozjS/71XLIiUJA3/BJTk4hC0FCN1by8fKME=;
 b=RZUOvFs1mmpF6xG8VsbLJpjUh3jyFFT83DaW1aVWILn1KsZpvAZp5TXYqt0OxHoUO6
 YCP0dbIm/rXLbEBCMnCWZW/y5eUZpY+2ccFYKnmi4fu4q/plGk3Q38xnn02SzMTvPtw4
 RTcIgmwb2P7obZfQ0V8dDfAH+rDptBAtXQf8Sfn4VlzlBqLyHr/x6A8PRvevY3rTi2xw
 eoUTcVSOBQpry7kCTfUarS8LCP2v72NTS1e2q4oSqcUqSY9sYctP9OQ5uAAjdhQ7n5nM
 e0tEu6WDs2KKtYfc4/cVe9AChEa+mjQPmIAGUvYZuINv4tU1/KEGIdetOAh6OFbiHGeK
 1+Hw==
X-Gm-Message-State: APjAAAXxYBiyAryTBe6Z9jhsrZ86OtdVVXYDNJ1j+pHeRXjMD8Kht3jt
 +jiFzHeBlmqJOqgNTn9Xiq1j2kGPVHI=
X-Google-Smtp-Source: APXvYqxgIEX1liBZ3JqsXBm4O1gvSQuxKWdObL4QC5QScACkHLdg05fbS0PNwjGLpWIaNyo78rIzdg==
X-Received: by 2002:a17:906:b797:: with SMTP id
 dt23mr475283ejb.241.1578418125597; 
 Tue, 07 Jan 2020 09:28:45 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id o15sm11797edj.3.2020.01.07.09.28.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 09:28:45 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id c14so305835wrn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 09:28:45 -0800 (PST)
X-Received: by 2002:adf:cf12:: with SMTP id o18mr111956wrj.361.1578418125072; 
 Tue, 07 Jan 2020 09:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20200107165957.672435-1-maxime@cerno.tech>
 <20200107165957.672435-2-maxime@cerno.tech>
In-Reply-To: <20200107165957.672435-2-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 8 Jan 2020 01:28:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v676EMruj4ZW4iERnNdBiZykk_ebZdMB_DTK4Lb2J2k5Gg@mail.gmail.com>
Message-ID: <CAGb2v676EMruj4ZW4iERnNdBiZykk_ebZdMB_DTK4Lb2J2k5Gg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/sun4i: drc: Make sure we enforce the clock rate
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 1:00 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The DRC needs to run at 300MHz to be functional. This was done so far
> using assigned-clocks in the device tree, but that is easy to forget, and
> dosen't provide any other guarantee than the rate is going to be roughly
> the one requested at probe time.
>
> Therefore it's pretty fragile, so let's just use the exclusive clock API to
> enforce it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
