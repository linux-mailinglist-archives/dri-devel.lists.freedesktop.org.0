Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB083FAE2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 00:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4A110FF29;
	Sun, 28 Jan 2024 23:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D02710E3C5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 13:51:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id
 46e09a7af769-6e125818649so218000a34.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 05:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706449854; x=1707054654; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hoKhm8UmKmFqAqj8kr0CZYS9Y8LZhXpWKBgPXERtM2Q=;
 b=WnN0QVZpSY/H5mhGI70Dd6ABf4k9P+5rTY41FD1Nh+oMLQ29BbP9IJ97SZr8/fBFrS
 8/8qNG4Hb+YC4Y8asCHNkn2x7BYkdDgHFiLo6skGmjGZby2u9T4uTI2dRdBkQaDN8KIk
 pFvra0GTbtdevNn0aynx/kllVEnz6cQhvKokhofT0ndyqfDVMUcvkpWuGu520eE5xYI2
 TWe3xYhqsPNc389ERD9eKThqPiWPXQtl7wwfDqdcbl3xN7t9RtPQoJUYkjFGQNYDITDz
 Wkyo7xPgC6INMI9ftZeQ6bpGNQcQTgONuKMXXgavqxRpoMssMrf2OCYo+ufn/TMMnbkL
 gPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706449854; x=1707054654;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hoKhm8UmKmFqAqj8kr0CZYS9Y8LZhXpWKBgPXERtM2Q=;
 b=wpubmohOiYBoJcWR/nZweNtZ/D0tZDNnEtZYgx6nk/0Az94F6fFJcg1EDjCO1oupng
 rdjpUAWoJSNNjEk54PpFFcnZwA04iaBspaQMwI2gaIso8zlGjf2BjfI+4t/tNVe76gaV
 L+fLsCG34QyLptoCjickSFmZSrWtFqD0CoDGovnAq22h9/SrkIGjQhLYmGNrjOpTedkg
 FBAA1L8uFIEBL3aXgA9e0LwKI6dQnPqosy+82zAKSwg7W3gL3xjBjTHPCrp9XdG17mx8
 g5tZAG7cC1TU4foGb6vu9QyDwJ2iuefXBqak0ksWxllCjr1N8+NgiqZiJ+scloZ6VpBR
 ygKw==
X-Gm-Message-State: AOJu0Yxh4cYsfwSLfBXWyE7pKiFuw8wGaDdPHtSqR5aMkMH9Os3RtaLK
 DADuGP9JzT6+E4RH8mFDV40WBDjIs6oMquZfdYF9Ia4sa6KnH7An4o5bWgKMgmTrViIqQQihDpl
 EGTra++E84r2g9Iu3ALn0VamgAoY=
X-Google-Smtp-Source: AGHT+IFUym5h9luI1CKHmsVMQOfUxiYMv0+sCcA5llT9jzKuSKa+RAlsV3UKrKTfzY4pbLBcLpF3yg18bxgL1Qf/Lb8=
X-Received: by 2002:a05:6358:938c:b0:176:51d2:802 with SMTP id
 h12-20020a056358938c00b0017651d20802mr4605965rwb.1.1706449853468; Sun, 28 Jan
 2024 05:50:53 -0800 (PST)
MIME-Version: 1.0
From: Hussen Argaw <hussenargaw69@gmail.com>
Date: Sun, 28 Jan 2024 22:49:59 +0300
Message-ID: <CADSTwnpMfUH7FzHjKyt9WdRBOLfXuxwEE6jntSK8sVGE_+DWFQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
To: gregkh@linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000057d1ab061001d195"
X-Mailman-Approved-At: Sun, 28 Jan 2024 23:10:36 +0000
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
Cc: robdclark@chromium.org, security@kernel.org, airlied@linux.ie,
 butterflyhuangxx@gmail.com, syzkaller-bugs@googlegroups.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 seanpaul@chromium.org, sam@ravnborg.org, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000057d1ab061001d195
Content-Type: text/plain; charset="UTF-8"

+251961377649

dila Ethiopia

--00000000000057d1ab061001d195
Content-Type: text/html; charset="UTF-8"

<div dir="auto"><div>+251961377649</div><div><br></div><div data-smartmail="gmail_signature">dila Ethiopia </div></div>

--00000000000057d1ab061001d195--
