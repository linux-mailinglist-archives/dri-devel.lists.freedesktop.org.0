Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C07F3A69
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE6310E2DE;
	Tue, 21 Nov 2023 23:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD76610E2DE
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 23:44:48 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-59b5484fbe6so64504127b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 15:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700610288; x=1701215088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOF5PgRQ9MPypMMVvEfLf6iXDrFT39tkd9kVEoZ4pSY=;
 b=iIkRdjQZ9V1b/UbxzR5w7SlHEYpNt6jyhCyayJPjngZ/MgbxYeawbuaTbmS1LzBYUW
 sQbNRYCCDRmjwZvT93r3NNQLyQOt1gnnexlpAY92DeXMsyEVX+BzKXJ96/ca00cekcxx
 gV+ulkceZFL8cf4/bhV2xqFhJeQhrAI8BgvBRrNsRKE9f4ZkCMKS6IKxjZG7WVkrozfR
 9Hh7Mw0T8JThmI6DBbaYip59MMK789DrdOmG6Rn8dkXAADwE0IIx3o1fwZt1ZjRmGD6K
 lzTuYgTzTL2voKpfP7xpmjWEXl02pz5sLUzUEy513NEEalyreYqJHlUvNgCBdLSVkANH
 F8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700610288; x=1701215088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOF5PgRQ9MPypMMVvEfLf6iXDrFT39tkd9kVEoZ4pSY=;
 b=YmGHobyS0AqMOQFIJNTE0r8SfWgQRUsZu9X/W7A5xXX65gOCHGumketnnMKvNvGQuK
 JVYOnP55TXkIbkNjrpXXNEd/X/7YrMyzBtJNSFgXN6H9g1HHRjRPxrq/KuZNS01DgVXh
 ABIYGh9A5aEQYby05U84Q0RZUDRcMMtH4WvLMlOuW3a38YBd6/+IkQSsxXoLyDI4wPvn
 CYIgaUzsR3slyQgLHgQcXh5z5dXMUPH0U/l6mi3qNPk8BnH5SRGFcARTjWe+6GB1afku
 TlJtorq568/K49kyLLfP0Aa/QhI8p9T5lY8o3yykwHhBFyUD1TCr6Oycio0q8xE/xA2v
 ehNg==
X-Gm-Message-State: AOJu0YwJy7aSXfw6wyEEmUblO53uNCOAk1vEe9iei14YV/5skCQGwL+1
 RAp7L+rJoVvBdU60LWMgtYNIs3YmADMzf1JZxV0=
X-Google-Smtp-Source: AGHT+IGWSSUWPLRaF4Wxh3sMU/os0Wv2ptxz81ue5ujUgU4IiUjxx8vdmEO7aP7P8A652LBWSejSP45UqO2icSDJoI0=
X-Received: by 2002:a0d:e304:0:b0:5be:7046:b2f7 with SMTP id
 m4-20020a0de304000000b005be7046b2f7mr496382ywe.40.1700610287912; Tue, 21 Nov
 2023 15:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-8-tzimmermann@suse.de>
In-Reply-To: <20231115102954.7102-8-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Nov 2023 00:44:36 +0100
Message-ID: <CANiq72nKSdasH+cweB66E-j_jesrXW-V56mNZYFg-0do-ef5eg@mail.gmail.com>
Subject: Re: [PATCH 07/32] auxdisplay/cfag12864bfb: Set FBINFO_VIRTFB flag
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 deller@gmx.de, javierm@redhat.com, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 11:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> The cfag12864bfb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test for
> the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
