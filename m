Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B8983B6A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 04:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D27E10E4C3;
	Tue, 24 Sep 2024 02:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lcOe1yxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708EC10E4C3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:59:48 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-5d5eec95a74so2326248eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 19:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727146787; x=1727751587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2A7oN5W7TNsx8rj73OuWfnvUP/XBNcMIaAb16FR0c0o=;
 b=lcOe1yxNMrL2/zE2o6QBF75c+ur1gnwvcPFZZb9yiXEMr3QL7ZqcgI4cYwgiox6d6a
 NQ/5+oTHf/0rXf6yYA+2VAGAzS7Ta9z9qA5z6HW5hRjjv00F+AGzalzujwaTZydNvfQ5
 beJ7Qiw7Kqb2WGqhgxYx4m/509imoXKoDbn94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727146787; x=1727751587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2A7oN5W7TNsx8rj73OuWfnvUP/XBNcMIaAb16FR0c0o=;
 b=f3kfJwzmtlHt23VNW6edZyNHCax+oCzT4vhQEhCZg5PeNDsgeVFSxL508Kdy0D+XMe
 V9qvkiZAkycVlEFdlbKSnSPVTrLaIwB/v6HMC1ATDj9KZI7rC+1KM6wK19EHPM25ngNt
 BxpDnp5EJdyGn2Dyi/i4aucWgZQPWegmZrytNhXkTQotJjNPu3GqJ/k8TvJc3bURjQ29
 XrJ32JshrFmPv0T0hYIfjn3nbFz9E0iu85KO2vUbRaeL5xek9Ctogb6YS61vNsCPbRgk
 1+ESNvQwiWFJIOd8A0bJfCmaU+qoSp4nqpUTDsJF9L53xrSHmm2ifaj0KfZ2asbcnNAP
 et8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXssiBebSPnBz0R5Un+CKKhOoQ8d8KywmgCBV+o5MKjgHqnFx54mo+tefcIAPHLUi7V2jEvGWeuKVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOFHKuDxQ+IDhO1C946SfUMqAigf34htpskgZHw30wW2Eny56B
 M3nc9FzmoXFG6+yY1OflK2WGHMZjo8MIvyEAr0OZD5s3tuCSelaeBFwqJM0NFHe9nvjZgT5ECob
 W5IYGZZifFsKe5wtI3UVyQtSnYv8AZvjtoHzg
X-Google-Smtp-Source: AGHT+IH1+SRKIPyBrUHidz4n4WMU3uFmkshuiWHBHVzYm97HXJx86PuKF5H9wpxkMmLpJwYwyoIA2gmVbOkzzmyWgkM=
X-Received: by 2002:a05:6830:6588:b0:710:ec5f:45b9 with SMTP id
 46e09a7af769-713923caea2mr10257229a34.13.1727146787532; Mon, 23 Sep 2024
 19:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
 <4viir5prnuvpp76npblwmdrwlttm5daumvdnocipdsn6geyxvf@2yfcytjb3ono>
 <a0a8f862018b4c9aa689672551e7a492@ite.com.tw>
 <mkx63gnb2fobxxc5jc2f326d2oviix7dahyoh4sfeuiyypucln@hnklvrtv4q2u>
 <169c171660ac4897903aef5befc780db@ite.com.tw>
In-Reply-To: <169c171660ac4897903aef5befc780db@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 24 Sep 2024 10:59:36 +0800
Message-ID: <CAEXTbpeSvpoHpo95wNznGYmJLaG9hTAJ5hVb1URRkkUddsOuAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: it6505: HDCP CTS fail on repeater items
To: Hermes.Wu@ite.com.tw
Cc: dmitry.baryshkov@linaro.org, Kenneth.Hung@ite.com.tw, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Sep 24, 2024 at 10:57=E2=80=AFAM <Hermes.Wu@ite.com.tw> wrote:
>
> >On Mon, Sep 23, 2024 at 10:45:49AM GMT, Hermes.Wu@ite.com.tw wrote:
> >> >On Mon, Sep 23, 2024 at 05:48:28PM GMT, Hermes Wu wrote:
> >> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >> >>
> >> >> Changes in v3:
> >> >>  -add detials about fail item and changes.
> >> >>
> >> >>
> >> >> Fix HDCP CTS fail items on UNIGRAF DRP-100
> >> >>
> >> >> DUT must Support 127 devices.
> >> >> DUT must check BSTATUS when receive CP_IRQ.
> >> >> DUT must enable encryption when R0' is ready.
> >> >> DUT must retry V' check 3 times.
> >> >> it6505 must read DRP-100 KSV FIFO by FIFO mode.
> >> >> it6505 should restart HDCP within 5s if KSV not ready.
> >> >
> >> >Still not readable.
> >> >
> >> >English text, please. Split the patch to fix one issue at a time.
> >> >Describe the _reason_ for the change. Annotate fixes with Fixes tags.
> >> >
> >>
> >> with fixes tag include drm/bridge like this ?  =3D> "Fixes: drm/bridge=
: it6505: HDCP CTS fail 1B-xx"
> >
> >No. Please read the document that I have been pointing you to. It descri=
bes all the tags and procedures.
> >
> >>
> >> About the reason about bug fixes.
> >>
> >> for example, the 1B-01 device count.
> >> will this readable?
> >>
> >> " When connect to HDCP repeater, it6505 must support 127 downstream de=
vices. "
> >>
> >> And this will be only one change in a patch?
> >
> >Let me repeat the phrase that you have quoted few lines above. "Split th=
e patch to fix one issue at a time." So, no, this will not be the only chan=
ge in the patch.
> >
>
> The HDCP CTS include serval items, I should split each failure item fixes=
 into different patch?

Yes, please. You can mention in the cover letter that those patches
are fixing HDCP CTS failures, but please fix one issue at a time and
explain what it fixes in the commit message.
>
>
> >>
> >> >>
> >> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> >> ---
> >> >>  drivers/gpu/drm/bridge/ite-it6505.c | 112
> >> >> ++++++++++++++++++----------
> >> >>  1 file changed, 74 insertions(+), 38 deletions(-)
> >> >
> >> >--
> >> >With best wishes
> >> >Dmitry
> >>
> >> BR,
> >> Hermes
> >
> >--
> >With best wishes
> >Dmitry

Regards,
Pin-yen
