Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B32F804305
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 01:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE5010E449;
	Tue,  5 Dec 2023 00:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165B710E449;
 Tue,  5 Dec 2023 00:02:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a00c200782dso693993566b.1; 
 Mon, 04 Dec 2023 16:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701734519; x=1702339319; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nAdAJnnuvsWso/Q/JT/1DE+qwZI1rbpsbfqcvp5PSdk=;
 b=LNH3EW9MFsgWc5bX0PkVdhgYGk0iBV8e5KhL9ZxB8fOdGLXvDL7O751qygYPEU7P0e
 xX65ty0s3M8CFntGvF7/AeokiqpO1YWW8u1mNMrXrgEfHSgbV2UlwhfM6MVOfyi0uHxR
 ReaBVPJnwjqaG8j6PPqz9F98l31JfflD6g8bm8bE4ZnBPUT+h+8/upO1LSz+BGfR/RIt
 0oThp7nHwKHWOhq08MVv4dUzA0Bg4S1DrDl2TLIdyWcU2Mpx11zXMovwv5fvXHSe0bBY
 QL/Z+DavO9cpLMAKye8nThOX5PosplSaMBGA2ewz3JAbUwjOvpskpkhUmz0q4a9Nl6SL
 I2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701734519; x=1702339319;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAdAJnnuvsWso/Q/JT/1DE+qwZI1rbpsbfqcvp5PSdk=;
 b=jMyZ2KQgS/XGGCtOiKXbOgjBE5yDHAUqiw3mpJQ2742cjR8FWPud3eUGJ1Sv/kk9jB
 m2Wcz/KjL1ugEIcXPw1NU79zrwhmx6NeMqKVEMjsWhgBVONNAxuGXRoZ3ZGyo5lmQrpi
 NqjAZagcSlJMqnHV5hiYCHq9bhgUj8+fnxrV+TZ30Xg4C7E3hWTaYr7dVQ+JCUKYI3lU
 1UVYv5R194P5YVDk/hAF38TnEQpRVYClhk+sOO5baMT8RgfR5WbiBE+smNVRhTf1qT5e
 8/+YIYI/MQfcdZLI3lJIxBnjLsbLtMaK7q3cZgNyblE+hamybgaH+NAGTXlmggfwNDXZ
 anyA==
X-Gm-Message-State: AOJu0YxxwrKNRDhPn0OF2bYLUx8K4PWnLQVQQki4jJyo2SYTzmjXoUdb
 4lVFMp6p0v5RiWLvtxXz3/5zWn+N+wWDTZPI6DlzLCzG
X-Google-Smtp-Source: AGHT+IFvK0ZBIuqMQaI20U5qtet1KIsrUYOvK2c8ydP5ewq+QHSxFjUHhsZSvBt7W7n4X2LAH13YctBR1hZ9e/EO+0s=
X-Received: by 2002:a17:906:86:b0:a1b:7600:1e40 with SMTP id
 6-20020a170906008600b00a1b76001e40mr579420ejc.166.1701734519116; Mon, 04 Dec
 2023 16:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20231204225519.358885-1-airlied@gmail.com>
 <30f51ed33c24b531649f876722a52f6628c194fb.camel@nvidia.com>
In-Reply-To: <30f51ed33c24b531649f876722a52f6628c194fb.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 5 Dec 2023 10:01:47 +1000
Message-ID: <CAPM=9ty8dxnHR0ha5AuWND9pUez_1ROMQPs=4g7toiTn98AdEA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: add three notifier callbacks that
 we see in normal operation
To: Timur Tabi <ttabi@nvidia.com>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 at 09:07, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Tue, 2023-12-05 at 08:55 +1000, Dave Airlie wrote:
> > +static int
> > +r535_gsp_msg_ucode_libos_print(void *priv, u32 fn, void *repv, u32 repc)
> > +{
> > +       /* work out what we should do here. */
> > +       return 0;
> > +}
>
> This is part of my logrm debugfs patch.  It contains the printf log from a
> PMU exception.
>
> Do you want me to research the other two RPCs and tell you exactly what they
> do?
>
> But if you're not planning on actually doing anything with these RPCs, why
> add callbacks?  Doesn't the driver already ignore RPCs it doesn't recognize?

The current code prints a message when we get a callback we don't
handle, this silences those, but maybe I should just silence them.

Dave.
