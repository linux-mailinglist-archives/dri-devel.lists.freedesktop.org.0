Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5D2184ED
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 12:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56246E202;
	Wed,  8 Jul 2020 10:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7656E202
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 10:27:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f18so40256583wrs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IjRLQcB/4vsfzip3HVsy3f1EfgWLrW+oCCHpaSHPM5c=;
 b=cYRbqZVHU+UGIQlbnx2Z5rmgwiAPzRJ5N1+U36opxHfpvlIY3E31tyKInXlALdp3QI
 D5TmwUT1LptThFMNF9zSN1OE3DLhWbhGI6tJPoZHf9PjxtfXK20kXBKr8rfLnEzpwhbB
 r4DuMxt0LWDZEE63w9arcO2g80YOsvUOgTLc9Y/VcHf4L5yXVxJtaJKxqW0lNz1/94VS
 X/hYdJvBhOR8nBwM2XD4LF33Q4bOL/g1uwUVK64widIlTYqUUNU/c/f8Qh8ejW7MOcYu
 3Bv1BzW0q3ZwBaJt5Bo//HpZ0UY1i0WQYQb04QiU8P+e0G6FCUFj9t/DhbXbVuOabf82
 fjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IjRLQcB/4vsfzip3HVsy3f1EfgWLrW+oCCHpaSHPM5c=;
 b=DJz+5j4nbTztWTZ6nPWXhNtgT1Uyq20dTIMt4e0ugfVWKO9xTJdVYlQ2PXz5eeR0Bz
 bIziASwSZuDSQuvXwRh1zVBWf0YnSmjaEc/+ocKqZT+hQaT1iXKnnDiam3KQGNAefAHd
 +M/XYMZpcRuCrQYOUOf32yXIVdZ8Y9eAENwvzr1s80VN8I0L/kyW8uHf5Y+I0Cn7Jov7
 LL5EC5KVrYSQ371+m352ujCbX8ZvuaTf5u9mGj63tC/Dc9vkcoCnLs/l4mnVMiMtqabD
 atAG5Q5k6k82Kq5oMZrZ75YyCzLNxK9Pg3LbwFzoJWrkYtTlggtmtDj0H9txQJ56IuHM
 bhrw==
X-Gm-Message-State: AOAM532HTb279AF3aPOxtgfkaUkNG8hYuzkju6FukLy2lXmV+eUXLbzP
 7sgysq8NLyDW4sizJD9fkN2mGA==
X-Google-Smtp-Source: ABdhPJz8knJVMMHfdPyGODA0TU0pv+HqKuQmmHYQntVTJaq/7zqxDlg0gT38DnQ+pHOidlry7bhcgA==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr59423071wrt.5.1594204077283; 
 Wed, 08 Jul 2020 03:27:57 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a2sm5179262wrn.68.2020.07.08.03.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 03:27:56 -0700 (PDT)
Date: Wed, 8 Jul 2020 11:27:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 12/20] backlight: introduce backlight_get_brightness()
Message-ID: <20200708102754.x3afazd7kbldjg2n@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-13-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 08:45:38PM +0200, Sam Ravnborg wrote:
> Based on an idea from Emil Velikov <emil.l.velikov@gmail.com>
> add a helper that checks backlight_is_blank() and return 0 as brightness
> if display is blank or the property value if not.
> 
> This allows us to simplify the update_status() implementation
> in most of the backlight drivers.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
