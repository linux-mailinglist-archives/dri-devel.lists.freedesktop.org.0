Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7406686FC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 23:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E59710E941;
	Thu, 12 Jan 2023 22:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DCB10E942
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 22:31:58 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 188so20410003ybi.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 14:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/C/ZRKjPzNTEZUCk+rnSkeE6htJTMyaRVi+BQ5BKJ+U=;
 b=JUPY63vtT6QcwqD9Ws2QE/pf7jC1/0su4w2j3d9Xn0NTdACzrFBjxjuFHWgpThUZws
 imdknTpaWEjV9uHtradW98A1u35lfMGg1dddhCwsBClQF94e0939KX7UTkXNgez4GIry
 JxaKGHbkQ7QWJVTYQ0VQgYI43iHND9qXIlcZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/C/ZRKjPzNTEZUCk+rnSkeE6htJTMyaRVi+BQ5BKJ+U=;
 b=EFNjNniAiEvBTowgeomXiQBbsS20dwMIBibm37VFlAGaQBvy0LZXHVGQ3O+sPz7gN6
 p/sx16ILa2N9herAmsfPJzIh/KB6th1F0x4qW3AtKnbTT+qJNgVK9oz8Y4hpnqr9yzMJ
 RX2VoznIaMoBFeLbeBbYzOEcfD1CD09yhYOmeBAzp+66hiV9+eFXS+Gh3cLXbUDlQgDp
 lNDjPPnis3LPXm5nSl7POwpDLGdRI7OMXULOjjQq9NX/P3eqCMm4owSe4kf6jcJpVMsc
 I5yQsQwiAAV3HIPH3VfPWcqfoY7RAn20TtWDdHkW+1E4LjftUs6ucX0IIQF0CuFZKNgF
 O4/w==
X-Gm-Message-State: AFqh2kpKJ+JPZkznXQr86Fes0Vs1N5lM/3eZB+7htLI5al6ul09QsNwf
 cILZvS2ALat6NdtllLHwnTneTuSxQHLNHTFSR0NuXw==
X-Google-Smtp-Source: AMrXdXuznEwChU9VQQ72rYVGqmbsFrMqOVBPMbeBVwgDM2AWPc/3hytO7eUeE33HPvr9ax9Vk/LALEeTjlK/OvpNWf8=
X-Received: by 2002:a25:1083:0:b0:7ae:5e48:383b with SMTP id
 125-20020a251083000000b007ae5e48383bmr2843942ybq.223.1673562717561; Thu, 12
 Jan 2023 14:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-2-treapking@chromium.org>
 <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
In-Reply-To: <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 12 Jan 2023 14:31:45 -0800
Message-ID: <CACeCKaeN7KBi30M1fRWhTPgMbxF6=B+KuAS7Ny7+i9qCx+=49Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/9] device property: Add remote endpoint to devcon
 matcher
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Sakari,

On Thu, Jan 12, 2023 at 5:32 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Pin-yen,
>
> On Thu, Jan 12, 2023 at 12:20:56PM +0800, Pin-yen Lin wrote:
> > From: Prashant Malani <pmalani@chromium.org>
> > +             /*
> > +              * Some drivers may register devices for endpoints. Check
> > +              * the remote-endpoints for matches in addition to the remote
> > +              * port parent.
> > +              */
> > +             node = fwnode_graph_get_remote_endpoint(ep);
> > +             if (fwnode_device_is_available(node)) {
> > +                     ret = match(node, con_id, data);
> > +                     if (ret) {
> > +                             if (matches)
> > +                                     matches[count] = ret;
> > +                             count++;
> > +                     }
> > +             }
>
> Aren't you missing fwnode_handle-put(node) here??

It shouldn't be necessary. We aren't break-ing/continue-ing here,
and fwnode_handle_put(node) is called latter in the loop [1][2]

BR,

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/property.c#n1256
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/property.c#n1261
