Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0594339C660
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 08:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4FA6E861;
	Sat,  5 Jun 2021 06:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BF66E462
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 04:06:28 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so11051717otc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 21:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xeDI9hFXLx5W0d0vXL40WkkyAGx7SjpdPOrSNWGx/78=;
 b=gnchVVvCqPImcc6X4xK9qKC+yU1YQ5ko95ugMWqTQ2s6Ms9MuzmaeIzLusih94yGS+
 4jcNBJj7eniiCYjhCX/hIBfmLmJA43neN75ab0w9pBOGpCsut9gesHmX8JMjt+SuO6Ft
 5eE27ECWYJ2WlQuY+d9UeY+q9PY682CKGo9YVHWEHkjcqfK4pT8bQREe5Irrw59TqEOP
 I0xlaiBURqJut54D0dJzXamUh1fQr3f9dQNoOPwqTMJxGJYSljDbDxGnusJmUCbTPaWa
 IygdY/HWGpSf+OHoz2YuRn6y6DP29sx8XVZvw6omyJ9AFkBnaKgZY9uVHdh9JVYtDEpc
 ND2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xeDI9hFXLx5W0d0vXL40WkkyAGx7SjpdPOrSNWGx/78=;
 b=gnjv+0ZmK/q2aDyh3gKWNn68eOlQPwab9BEKuF03/EGqPJJl9R3lSp4yAPquNet14i
 1VW9bA50rbqym7Xenk/BoYj/iFDNazOoTjNsaGIXAF81DCaSP/S5y7gp7l42BkdfBWPz
 GuF3mnuxln4rQEQyqAmEx9PFZZBzWin6RZ8iwA6qjfTG01sd/7ZS10DI8lTv+9MKD24N
 OA9wndcaBOkHg1tc7qeJSnlfE4b0v3cbpVe3meCLamLjUKmu0cfwjSg4WGeJn3RTS0Xa
 Vigwzg617xygP0brZ+tCWMdbMc1aSAMup6edNtiCtFM3F5OFn2Bi50NsRf4z5wLLHzLN
 phEg==
X-Gm-Message-State: AOAM533RxbfCI66bkBkpD5Vtk3WwVEbacg8ujh9hBy3XzXU9gF9xQ4B6
 19xq+V74688DuaPaHShUywo5whdmDmMGSPCeBmMNzoslaqUT6A==
X-Google-Smtp-Source: ABdhPJzvWu5UTo4zpjSLiH6zzpaZVyHiYXkZ+3wiu9EhhNvxFSF+ICk+9ZOalCdeD9rVmopRMk+X3e0DhQ7l8ZzEREg=
X-Received: by 2002:a9d:1d49:: with SMTP id m67mr6408898otm.76.1622865988089; 
 Fri, 04 Jun 2021 21:06:28 -0700 (PDT)
MIME-Version: 1.0
From: Sichem Zhou <sichem.zh@gmail.com>
Date: Sat, 5 Jun 2021 12:06:17 +0800
Message-ID: <CAJeZQfg5fq8B7iVu6Wga+aM015o_ViiSUcJxAEtDE9-GXxgSOw@mail.gmail.com>
Subject: [QUESTION] drmModeAtomicCommit returns -EINVAL on return
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 05 Jun 2021 06:47:36 +0000
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

Hi,

Sorry to post usage questions here, but I didn't find a better place.

I used libdrm for my wayland based compositor, it generally works but
I've been experiencing hiccups here and there. I have a few questions.
Most of them are generic and one of them is specific.

1. Is there any way to debug when the functions like drmModeSetCrtc,
drmModePageFlip and drmModeAtomicCommit returns non zero, besides
getting the errno?

2. Do I need to attach a 0 fb_id and 0 crtc_id if I intend to
deactivate the connector? It seems I don't need to do it in legacy drm
code, and I am required to do it using atomic functions.

3. I tried what I described above for returning to tty, however I got
-ENIVAL on return(maybe it is because I didn't wait for vblank).

4. Do I need to wait for vblank for modesetting? I know it will be an
error if I tried to do drmModePageFlip before the last one is handled
but what about drmModeSetCrtc? Do I need to wait for a vblank for the
last pageflip?

Is it actually valid to set a 0 crtc_id for connector and 0 fb_id for crtc?

Sorry I didn't place the actual code here, my application is already
rather complex and a lot of abstraction on top of it.

Best regards,
Sichem
