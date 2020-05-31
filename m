Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E671E9947
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 19:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AABA89B69;
	Sun, 31 May 2020 17:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528F89B69
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 17:28:19 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id b13so2558992uav.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZozB1aywbm7tpZiiEIDLppG0TkWRV6mux/NRc+QS5Rg=;
 b=DKFBHNocivTonmTQukJKzhx7iuP+dsYx8L9flcQ8wWCzakbjQSLZJR2YNzla102yAy
 6WP32+AbIRuA3S6/Yslfslofk28vdMi7nq47FqTdbBXATXC4NsBFP6rMK44fcGUMQfVF
 rTXgm5NDrzGu2ETkqWPQgoWURWHjFbwhMEDgXk8sjXdIgTJPvdZ5iiphHqBpKzggWsLP
 yfarVngetx+xpfJfSNQCVMBgLz5fq0Upi7L8/A8FQnpqB7FU9qzNoLIqOlj086/ufKDF
 y7sD9rxEoW9ODKD7hE4AvOBvbOJxpGH69K9PcQ1tPjS1P+zyEah5m72VyzXpNkRhGnJg
 dTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZozB1aywbm7tpZiiEIDLppG0TkWRV6mux/NRc+QS5Rg=;
 b=WeUPxdT0y7JaFHfF4KFIr/Moen0cn9nrYp5KLareGYacryud26ocZ0tNQs4XmTDyNZ
 qKcW/jVUtaxpP7tlmkiDrn9wWFSAXbGwPFnirr9+Swye1UojbsnvWmIUN83cpFNauP5Q
 OZnEZkW3KW7HtqYaXlt3xv6I3rZDoiHn/WcgzV2SRDFShBTGquCgXpbqMbJNkiE/1fBm
 olIxXSY5E9iu8VR0sNFaA6YjTWFIVxDK40jtD1o5206bKtWMrfKdENITdKzWSZDM+z1d
 UnnyjV5Lds35sSULq+opqh9VYDX1vAOx7svzKO2voZY0i42T7mOA0bz3iqJVdUNWmF0b
 GsrA==
X-Gm-Message-State: AOAM532gMq+7NIViwni8tUfMuXAj0gJ6Cb2PFepHXKPa4WJov9xo0Zid
 TRHN/ZxVLY6L8oV4RcQbOlNv2Yod47qo91n8RGo=
X-Google-Smtp-Source: ABdhPJwb4++ENPML0LZa8amrsHgl/5NHoGF88rz+jk8sKu7eW6HVA7UCtky7u388Rnn0TeoGRg/0pSREvb5clyOtI/A=
X-Received: by 2002:ab0:3055:: with SMTP id x21mr11768613ual.106.1590946098152; 
 Sun, 31 May 2020 10:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200531093025.28050-1-hdegoede@redhat.com>
In-Reply-To: <20200531093025.28050-1-hdegoede@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 31 May 2020 18:25:04 +0100
Message-ID: <CACvgo51DbOo+PWoon5vxy5mCv-62h-=imgv20NnMpkB9C=R5-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: panel-orientation-quirks: Add quirk for Asus
 T101HA panel
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 31 May 2020 at 10:30, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Like the Asus T100HA the Asus T101HA also uses a panel which has been
> mounted 90 degrees rotated, add a quirk for this.
>
Reading the commit message, made me wonder: If it's similar why it
doesn't use the same quirk?
Something like the following helps:

... 90 degrees rotated, albeit in the opposite direction. Add a quirk for this.

With that the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
