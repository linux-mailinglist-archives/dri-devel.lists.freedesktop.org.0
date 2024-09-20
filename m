Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B697D7DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 17:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7EC10E855;
	Fri, 20 Sep 2024 15:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lxw4U9Ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8118F10E852
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 15:50:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53653ff0251so2589022e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726847408; x=1727452208; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KSTgG1ONFuwyX839G8yS/YFRBceOdoCcCoRfbiWXxRA=;
 b=Lxw4U9Aih1c8R/0Q+qMw4WjnpLLUZpzcCL8OkXNWYDx4fBgFT6ZvAjQcQN6N/gjnJc
 UbVS/HaQIUzG07RJJdgp4vM2Jp6k55dckxivsvFxUa52WTl4XK30mAKxD28BUpb+kB2q
 h9e2RtGfXrys2wBEzxRBba5d+oK1NUMniipQgX0ijqiETLZemH1c7cRBZviYw1zPkKbW
 FubVoiqQQYnVDYt22IqWaZcX58VvAfH3hhE7L3YUUjteSiwYxX9k3W+eNkZU9QwE0TVE
 oOdCCsyyuk6Hh/o+/3Wosb3q3or8oYdqhiFGc0t5Qce05YzVvyuqBh0vCpbD5topz3uH
 oZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726847408; x=1727452208;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSTgG1ONFuwyX839G8yS/YFRBceOdoCcCoRfbiWXxRA=;
 b=MEt/SE6Z66cKT4tmHucyuImet2YwcSM2qisD4c9zlwPRfz8PK/heBDKQ0UBJeH4Kjp
 krhnGpyW+2crUDYy7NcFNz3aaqhKlmTckDLD7rmvI6duWb1YKgeugzF2GTrTUGKNFYz+
 lHcFWReOa9EqiPgPZDz52tcGnBw249clksESkob8sue0O6EvA1lxuq+zP4UN4HNsY+YS
 LcKwapA6vHQsdlZKA5y3AJbOvGrSAjE4yxpQ66G2FNI7ebvJfpPPRBsUOa+CL4sHVQzt
 Oc6HwDvD3YqootPJAuK9PlAvFv/inFhnVkrnIEfEWShs+rddVOHpAjo5SrbC5f9oQH8d
 uryA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn0lBODZnzZB2Q8EpP1Tpt7XBFy5oKT47IWr+yQyC+WinkiJ4Jg30WaPdneZ8exTj5SPujEp++FRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweNvHoNb/661ReyLAhEu00+1JCE7SPOvtcWXKsv/3hWyWm52H9
 6XdQ3pHLzuquIqHcByP5+kv6Jri9L+xwsA9NnZqiZ3P+AQyRtm+Q1AqzEZeuoaM=
X-Google-Smtp-Source: AGHT+IFFifI1MUsOVRDjkDVOg+d0xUbcZiymFm1+Kp7WhRry1g/Fga9+FS4wV+y+d1B48js9K9fuPw==
X-Received: by 2002:a05:6512:2391:b0:52c:c9ce:be8d with SMTP id
 2adb3069b0e04-536ac341b82mr2170221e87.57.1726847408505; 
 Fri, 20 Sep 2024 08:50:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53687047023sm2210754e87.45.2024.09.20.08.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 08:50:08 -0700 (PDT)
Date: Fri, 20 Sep 2024 18:50:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Hermes.Wu@ite.com.tw, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>,
 Kenneth hung <kenneth.hung@ite.com.tw>
Subject: Re: [PATCH v1] drm/bridge: it6505: HDCP CTS fail on repeater items
Message-ID: <nczuje3ur7sf7uqkygtziwnz5p6b4b7bf5on5crljr2ijmblrv@ym3fkvqxbjq5>
References: <20240919025551.254-1-Hermes.Wu@ite.com.tw>
 <CAEXTbpc7N2v4LwoZ4wpHXi7ogyqGwYC3Gpt5sqfxtOpYrngPLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpc7N2v4LwoZ4wpHXi7ogyqGwYC3Gpt5sqfxtOpYrngPLg@mail.gmail.com>
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

On Fri, Sep 20, 2024 at 01:27:54PM GMT, Pin-yen Lin wrote:
> On Thu, Sep 19, 2024 at 10:58 AM <Hermes.Wu@ite.com.tw> wrote:
> >
> > From: Hermes Wu <Hermes.Wu@ite.com.tw>
> >
> > Fix HDCP CTS items on UNIGRAF DPR-100.
> >
> > Signed-off-by: Hermes Wu <Hermes.Wu@ite.com.tw>
> 
> Reviewed-by: Pin-yen Lin <treapking@chromium.org>

For the sake of somebody applying the patch because it was R-B'ed

Nacked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The commit message doesn't describe what is being done and why, it
doesn't have Fixes tags, etc.

Hermes, I'm not sure what's happening on your side. I have seen several
revisions of this patch with minimal modifications (and being a part of
different series). Some of them were marked as v1 (although you've sent
different patches as v1), other had v2 (but no changelog, etc). Please
adhere to the described process of sending patches.

-- 
With best wishes
Dmitry
