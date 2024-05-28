Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9F8D1A69
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FA210FD84;
	Tue, 28 May 2024 11:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CRCa6FGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B998D10E862
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:10:01 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-579fa270e53so112156a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716880200; x=1717485000; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=H6qDXx2XXterTdHR6VpitrlOFjDTz8FVqIAD6KKEBhg=;
 b=CRCa6FGC5AofUEKDNsT8Br10DEcaRFlgZU6W9ddKCJ65ZNLwfyrr1zPxAYxa2HmJvn
 1spabbbfuPiT8JKvw3UoQlyuc8ZELvEdxdx/DMfSKhrl12VfwGSgYuM0TZahIjH+PHdW
 qYRIn+GUPLNjLIsDzjNc9MWIyr0XWjwgxefOBplK2bamFsIlza+Q5OToV04HSxCJk/Ue
 53PJ/5CFAR7ukkrptCXNm629ZHhMjZ7miDSjknrowZIZ8bOYAsboOXQ74zsLgQXe85/i
 5Au2mAvnYZddk1Yeq/BzEew/J491iIAwc45YfwF1epIw1C4S4Ol/X0Fje5ZLOfWizOJl
 wDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716880200; x=1717485000;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H6qDXx2XXterTdHR6VpitrlOFjDTz8FVqIAD6KKEBhg=;
 b=H5uiDksy6QP69XlaEFd2A1YQ+6zyrzVkh6XEafbIKGF83hEyx5byOgpjQ47yEkdsFA
 ahgKZzV4pWf+7SUdmLwmgDMv6FyU0Q/5jI6NHUIQlEVQMtcCmjUhU4cg8RW+giZfZym9
 TIx3XuBplie8HeQ1o1TlUIK9Jrn9sp5L3Dew7Pr/h4YLaLaF9UKlglok/4OBxhHEaq32
 2ObwLOXfilpdmMnij5l3Pqv8pq+GzhS4qUo9rnZ6jmPMWswWu9ii9zX270wUs5UGPARm
 fhs+uU2hje07PhAyeDgtN2wAkq4NXimWZHHKDJ3L5Qf6UPjHvCUTNPsoOyR0OyG7sgOK
 aLzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS2r2QKZhpHibY38UaVO4ymYgiKztsfIVsTdeyhH4iNtpAyma6vAccwo7z3E4/roCBy/DJhk7R7ki07yvS4XvKQ2cpkQZwKJhhsRs0Mtvb
X-Gm-Message-State: AOJu0Ywq7NchKEunuupzA6TgtOSGT772QdEAlNyAZzugGJMxiBQjSthd
 UcibAGSkb2EjdDNpieC4mZSae0yfnOAZp4rZsxBS4UtqsEk4Xq8Pg8olgK68OJS6IDeq5i/znsG
 kxIJFjVtJgI+XD7wutbgv7NzaJis=
X-Google-Smtp-Source: AGHT+IFoJvh2KzX6A7qaBCTEGHv4dHcmgnDhX9vr4NEUKEAMjyXLZmsDkxinoPxFUcBhdGd8qlQh6P5JlcBSj8vsJ1s=
X-Received: by 2002:a50:c88c:0:b0:572:9b21:e0c9 with SMTP id
 4fb4d7f45d1cf-5785193ef4emr11947154a12.14.1716880199643; Tue, 28 May 2024
 00:09:59 -0700 (PDT)
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Tue, 28 May 2024 09:09:47 +0200
Message-ID: <CADomA497J_Y-4vm4-3Wh+t7vJ-JOshHMK9yfzZpyZ=3Z4xyK5w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add WL-355608-A8 panel
To: ryan@testtoast.com
Cc: airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kikuchan98@gmail.com, krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 macroalpha82@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, robh@kernel.org, sam@ravnborg.org, 
 tzimmermann@suse.de
Content-Type: multipart/alternative; boundary="0000000000006bfc8906197e52e5"
X-Mailman-Approved-At: Tue, 28 May 2024 11:57:25 +0000
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

--0000000000006bfc8906197e52e5
Content-Type: text/plain; charset="UTF-8"

Tested on my RG35XX-H, no issues

Tested-by: Philippe Simons <simons.philippe@gmail.com>

--0000000000006bfc8906197e52e5
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Tested on my RG35XX-H, no issues</div><div><br></div>Tested-by: Philippe Simons &lt;<a href="mailto:simons.philippe@gmail.com">simons.philippe@gmail.com</a>&gt;<br></div>

--0000000000006bfc8906197e52e5--
