Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9F675F83
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 22:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5317C10E129;
	Fri, 20 Jan 2023 21:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2795010E129
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 21:15:42 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-4d19b2686a9so90277337b3.6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 13:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NcIIC1O7Zs3rEuEM0nyGO+WgzZl8Vikm1z2RFIGcKb0=;
 b=fhs5Iuj4i9tYiLtWZSoxdZ7lQeEEve400Bj1Vri0BU6rTFbqMbm9zOTpruHHGJiSv+
 45iwza4m7m6J/UZxVCr4lOZWhgR3egS25OP/hJ5DF5TxBJPR6a3YEs64lCSotn3bkRIl
 EpmHRQpEh50uuJCoQCzB/3vOLGZVErgkFlHxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NcIIC1O7Zs3rEuEM0nyGO+WgzZl8Vikm1z2RFIGcKb0=;
 b=n3eCiTirLsj1+DXYmCzZBrJDsCUglUsAAbTPZ0bAj2olCuhuosh9SOiTNv3mHqDXoi
 l10gngu/FTQ1YTwueuutDhZRqELwYvbs/ewTCdRuXydg+p8yPM8riRTU4NMoZgcmDP4I
 iA6bmYR1LCNU115EWpH9q9pl/W5J6v6uF2R4fjccl4MmHcsNbBDlYt5FcKuxlOp5dAe5
 JlfSqA2Stx4lzwpSv4ZU6OXHwGlL+abw2RK17QOT9heIV0GlairYsKT83I0bbK7VRCLA
 ftks2+CBZZS7O8Z4gO60AxGLimbmfMlQc3ZG6Wqv7S5Dfl/DP6uCchCQuORK72H/6yCG
 iYsA==
X-Gm-Message-State: AFqh2kr28ZHiHt3ZxMRMH7IAmZsCF/MREDfDHJT8nHpe1XVXggVabGHC
 bxKwWnGQkT7fMkem8d/sIJ7taQxIK066RcXeguLCfw==
X-Google-Smtp-Source: AMrXdXuzhv476FXH02ilyJSYLORoSx3+kBVAKevbSIn6Qmw3KTvOzqgdIKhThap2Fmmuhb9Bgf50pSjtYaxEVyXLlAg=
X-Received: by 2002:a0d:e8c9:0:b0:4e0:7220:22fd with SMTP id
 r192-20020a0de8c9000000b004e0722022fdmr2086808ywe.272.1674249341272; Fri, 20
 Jan 2023 13:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-2-treapking@chromium.org>
 <Y8AL8nTcNcl6zX7H@paasikivi.fi.intel.com>
 <CACeCKaeN7KBi30M1fRWhTPgMbxF6=B+KuAS7Ny7+i9qCx+=49Q@mail.gmail.com>
 <Y8VL/+My+s/PkG9L@paasikivi.fi.intel.com>
In-Reply-To: <Y8VL/+My+s/PkG9L@paasikivi.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 20 Jan 2023 13:15:30 -0800
Message-ID: <CACeCKaeaQ+LHsnwdqtTA=O3Q=0dWz8_uNjXoNu5J_u4+HQLMsg@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 5:07 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prashant,
>
> On Thu, Jan 12, 2023 at 02:31:45PM -0800, Prashant Malani wrote:
> > HI Sakari,
> >
> > On Thu, Jan 12, 2023 at 5:32 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Pin-yen,
> > >
> > > On Thu, Jan 12, 2023 at 12:20:56PM +0800, Pin-yen Lin wrote:
> > > > From: Prashant Malani <pmalani@chromium.org>
> > > > +             /*
> > > > +              * Some drivers may register devices for endpoints. Check
> > > > +              * the remote-endpoints for matches in addition to the remote
> > > > +              * port parent.
> > > > +              */
> > > > +             node = fwnode_graph_get_remote_endpoint(ep);
> > > > +             if (fwnode_device_is_available(node)) {
> > > > +                     ret = match(node, con_id, data);
> > > > +                     if (ret) {
> > > > +                             if (matches)
> > > > +                                     matches[count] = ret;
> > > > +                             count++;
> > > > +                     }
> > > > +             }
> > >
> > > Aren't you missing fwnode_handle-put(node) here??
> >
> > It shouldn't be necessary. We aren't break-ing/continue-ing here,
> > and fwnode_handle_put(node) is called latter in the loop [1][2]
>
> It is, but node is overwritten just below this chunk --- before
> fwnode_handle_put() is called on it.

Ack. Thanks for pointing that out. My bad!

Pin-yen, please make this update when you send out a v11.

BR,

-Prashant
