Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2205487ED4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 23:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAF710F3C4;
	Fri,  7 Jan 2022 22:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D7410F3C4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 22:14:53 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a18so26244896edj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 14:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SySDfXOcDDxrxdLlLmdKDsi07wKtcEMMXGppknRGrbk=;
 b=QXF3IO5zOQty2LsLhkAjI+1Ed7n5kUIhbHd4d9nM8uYhasFHC/ZKIivnMX4GzrXxcy
 Bp5VHzAbuRdgKl85GD2iC0lv5n9gabLxH4zJpJPaUbNQQ8r31BGGB3fn8cLPUzWAmmNu
 FzCfShoplLGN01S01f0Aw8ayN1UifhovWLOK1EXS86yt9S2x1QLnYCqRKDzkR287aBLp
 Z5tue5rIyi3RKW9YDDsaTj5CYVE5KS4xznc4oO26Pau35D48nQ7IdcSlrxB7HmauUd4G
 7TFiLFioRbQmLQnYNWhnhG8tzA3MwdRnBujwDFNeidnBSLGf6rMln8BQd6y8A31zIClG
 Tcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SySDfXOcDDxrxdLlLmdKDsi07wKtcEMMXGppknRGrbk=;
 b=W3BeuNJRT26Nei/TgWvVRlD6q7nYFOEAep3Og8qWu05Tjz13uAe3FxTYpmcQqxZd4l
 bu3fTvgG88ZFNqZW8uSCYvbzSWm3HmvAQwOUwU5emWiKxhkaMDhG4elA8KZt0ZsDctQ4
 H24Ahd/GdpU6Wne7DTcllGzfWUAGALXlVjpm6vzTlVhR+Za3SczAo19fyczBc95uekKJ
 T2/Ff/d1+Es0vlgwtgNyu2TSW4HqxcFWIbO4PV9UETkt6Wv27XcZ0XKOLaj9+4BRb4pl
 qT2wmy4wyLYLq6RZEh4/TyXIfUO+gqI6XC8OXF89mrJoo3SmSaPz0HhKJq8qNqkuGShZ
 hADA==
X-Gm-Message-State: AOAM532sVolya50+Pkgvdg80oXKW5h2p6iIEZ6W0MsBcNwN9JSP4CGqv
 yHGgD2J52edeiBWHx4JHTrgy1hfsQwk8qzV9+Sg=
X-Google-Smtp-Source: ABdhPJwAVQUd7nG/enEXRg1iURonC7ksnQzp9JOzzkBuRvOF7MWlM/7EzXIRmvQCrE81lA1p/W6+VAkq/sYpAGsCL3E=
X-Received: by 2002:a17:906:b89a:: with SMTP id
 hb26mr9338135ejb.147.1641593691749; 
 Fri, 07 Jan 2022 14:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-3-narmstrong@baylibre.com>
In-Reply-To: <20220107145515.613009-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:14:41 +0100
Message-ID: <CAFBinCArnZ8XtaBtWa0smmPTc-sHvAdD7_-3iTywxUJ08-uyMw@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: meson-vpu: add third DPI output
 port
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 7, 2022 at 3:56 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add third port corresponding to the ENCL DPI encoder used to connect
> to DSI or LVDS transceivers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
