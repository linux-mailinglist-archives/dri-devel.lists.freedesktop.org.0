Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5314D303805
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568F56E41B;
	Tue, 26 Jan 2021 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39906E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 20:29:08 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d4so8383169plh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 12:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=L7hcJowvgJK8XV5T2kSWijbbIn+FH0xsHHJJGhXiQE0=;
 b=O0ld6mWRMFPALAbHEFHcpFb3ogYdK765/sIFvWxcavPzvG3UvEenEJG/4gDiZpQxp3
 dKdkzZEU1UiaGk3ow1+GBrlKcORtjunc2W2f+ouEhzj0sVyZp+sHgSv5dzqdgwEmk1Fr
 TXufxTyI0yW8X5HVP7fhfvH7h0DHQKCtx8zZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=L7hcJowvgJK8XV5T2kSWijbbIn+FH0xsHHJJGhXiQE0=;
 b=EeXtpMrr+FZbXsM+Hkd6mNVQR6xiEHOXD/8SpepLzJpyprFnt/bT0Atq3L75BhTOnR
 WZ+hucarfddacY1WTxh/y7DijJPaND47DMioIDIPJqoJA3k1KUljEvrkoVDKAV31z0Z/
 4HQEat+9n+IhDuFd7Ezae55+Gdc5jOAp39Nopi3s77w63VuaNuKezBaVFwFbHecpMSEn
 l/m2hqmG1q8cd88MCBE4o4QatTtuZKAd3tik/jRfWmw4i9eB197zuajoIFvUD4ZCx4IF
 DQdDfPoY2dToVn45J14DyH1K7FtDoYfaKj5BpsV2OhL7RmxBVaow7qOkbUdlcOnaXAa1
 0HUg==
X-Gm-Message-State: AOAM5314kaYU6Ao7bdnZpcIQ3pu3Fk42JxaGsp97l3kFHDK4PkxvOxM+
 ycGyrtOP0P7rW1bRc8ejxVtQ6SaUzV/xAA==
X-Google-Smtp-Source: ABdhPJxsTjN0zorpk0zOXXWw8UDdJVB06DcpY582k8+LI0wqcMj42Yy6RVlk3j+kBGaTZOz/Ysc8AA==
X-Received: by 2002:a17:90a:4dc1:: with SMTP id
 r1mr2045991pjl.12.1611606548517; 
 Mon, 25 Jan 2021 12:29:08 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:1066:b437:97cd:2278])
 by smtp.gmail.com with ESMTPSA id i62sm14073923pfe.84.2021.01.25.12.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 12:29:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid>
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.4.I6889e21811df6adaff5c5b8a8c80fda0669ab3a5@changeid>
Subject: Re: [PATCH v2 4/5] dt-bindings: dt-bindings: display: simple: Add
 N116BCA-EA1
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 25 Jan 2021 12:29:06 -0800
Message-ID: <161160654656.76967.8777176702304883328@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-01-15 14:44:19)
> Another simple eDP panel.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

With subject fixed

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
