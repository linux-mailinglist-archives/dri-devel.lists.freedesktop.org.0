Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C817448DA5D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 16:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE47D10E226;
	Thu, 13 Jan 2022 15:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC4B10E226
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 15:02:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v6so10600928wra.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 07:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NjQ5CckMH/FqJHfWgmyb7DQKMb+OQO1cEac1mm0zNp0=;
 b=yt160kvam3HJdDmZb3vsgy1B/f68cJyCqRxHQGpeUER/bpnSaBG7Qh/n9igDWSpKlW
 lMQHT+qDXxcH3Ji+D24uEeHoEGgFn9vwppBCwpbmCI00TJsAxYE/zuzhspFjriUt3zIO
 xO1kYIHSoT7TdChA2VswjVnPZ7zaQG20FDT4WB+SdrPYYjW7k+3dbRvf+geNvagAYkpq
 AMr5RBx28EPYCSqhT8++9pqwwsSMEFhlsEOhqs2BGtwAJqEMVFDO3V26YtGLQ8Pu/OqL
 ga6ApEUefApiDfHc9WqxWYwCOHyKMnDIWJPL/5ETrgBEebfweJNEM0UEZko1ivBtaQjx
 zw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NjQ5CckMH/FqJHfWgmyb7DQKMb+OQO1cEac1mm0zNp0=;
 b=GeVLwyvy0EEy6dNF1VLxFUS4sIf5NFFFre/f4xt3nW3e5F0HdSEiDEVvtKGtJwSl91
 ECQD7MMeswgbKNn4jlQ2E0/wIgd8kX56AjZq8o/Zy4wbqY4MK6p10iCYLJUaT1Qr9hNj
 kIQk4ptl3Bo+V5UhwXktC95AKTc4ks7ASeNQA9b1ZXkRepCybndV420RAcn9Ma8lbcJP
 69lKN2BiequtRWnA2tGQbg1PKYpZZ/kvA1aiyueGAIVYVlonALy91afhi3EZc60RJOFG
 1ebHLKpIddtdWO7gurN9orR/ogcCUSVicpS7Jv4VLoESJpygQzAoJZNLf6nuuq3EWvIc
 m4gQ==
X-Gm-Message-State: AOAM533c5MpKsuZDIlQI8HE/JIa/hLcN3MWIwsR0ewJZcy3i5LeeDdU5
 raHfLqnB/QIvBU5to4hUUHv2Ig==
X-Google-Smtp-Source: ABdhPJxel8Y0oxv14BbumdD74ugMJ5nF6Wawn+vNlK5AtA4I45AJGBMjljCF4xkTlJ3wYfJ8vpqPrQ==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr1836447wrz.395.1642086157839; 
 Thu, 13 Jan 2022 07:02:37 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id h14sm2682335wrz.31.2022.01.13.07.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 07:02:37 -0800 (PST)
Date: Thu, 13 Jan 2022 15:02:35 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] backlight: lm3630a_bl: Remove redundant
 'flush_workqueue()' calls
Message-ID: <20220113150235.fyzee7bhx7uceiwk@maple.lan>
References: <20220113084806.13822-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113084806.13822-1-vulab@iscas.ac.cn>
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
Cc: jingoohan1@gmail.com, linux-fbdev@vger.kernel.org, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 08:48:06AM +0000, Xu Wang wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
