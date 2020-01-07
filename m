Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E81327D6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88016E079;
	Tue,  7 Jan 2020 13:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAC56E079
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:38:12 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r21so50341842edq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 05:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Ogr0kICtWAKUCwX8COeBVH7wt+URVAc4vJxZdPJDTg=;
 b=P5VAKtI8xEokMlAQLSsCpdyKvfN6IzOcgYnOlSVhJKCJ0hKMgC3w0b7xVbqcSDqxVQ
 qwv7Cldp2OPfpqVq4hIghPKJE34gsLJ5LsE9gn6b4xQUSfcQjLFPvw88S8+KyyVMgWcs
 guH4Curri67RfYCsrYGhvyEnIhP6PE2FKmQ8+gAtx+vBSUW73yHRf0S0yzwSQQXVAhdK
 Nint06lbAb1JN/WawHuzQxBy7YYv0isfd56DHrozVP/3aIJ1Keq/nIHtDlhw3ImDroRh
 z04LRuR5hVpJ/Liv5jxyCtJ/Wj6z+BzWHAmKLxjkDAeVXHB4yAyRbe3fDeT2oiCbfeQD
 kZ6g==
X-Gm-Message-State: APjAAAV9bv1NPxj6E/b0Y0ov4XREYAmCu2A5UCoc4hblyCq3eOm48MPa
 SyvZbf33WnuFcppyNJXy2MKv6nrH8BY=
X-Google-Smtp-Source: APXvYqw1wvkTwcO5vNc3JA96rvA9gwR4Ms9xsKYszMIl4qbRTXPT2a+6QlH3HvdjkOTJUOtI0y0HmA==
X-Received: by 2002:a17:906:55c1:: with SMTP id
 z1mr113221286ejp.288.1578404290542; 
 Tue, 07 Jan 2020 05:38:10 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id s7sm5746779edh.34.2020.01.07.05.38.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 05:38:10 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id c127so14228871wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 05:38:09 -0800 (PST)
X-Received: by 2002:a1c:a50e:: with SMTP id o14mr39148147wme.2.1578404289688; 
 Tue, 07 Jan 2020 05:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20191219092000.949052-1-maxime@cerno.tech>
In-Reply-To: <20191219092000.949052-1-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 7 Jan 2020 21:37:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v67VxM=zmLCA1yS2vvwhwHRy7zHnjb69y3psVtBsUj3wWg@mail.gmail.com>
Message-ID: <CAGb2v67VxM=zmLCA1yS2vvwhwHRy7zHnjb69y3psVtBsUj3wWg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sun4i: backend: Make sure we enforce the clock
 rate
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 5:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The backend needs to run at 300MHz to be functional. This was done so far
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
