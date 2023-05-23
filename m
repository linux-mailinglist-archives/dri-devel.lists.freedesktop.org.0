Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892970DD4A
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 15:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5F810E030;
	Tue, 23 May 2023 13:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9245810E030
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 13:15:18 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1ae763f9a94so37532085ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 06:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684847718; x=1687439718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xAthNGXLDTLFcaxsW4zu97G9PTQI3Egsf4QBteoBFtY=;
 b=k54tFE0GkEBjf/zrY3JjRi8VDYwp8E+3GAYXupXplX8za+1IayFvBWHCVbDls837R+
 JNq0uAXf2GbEMmI9RxqmH8HtLETJDEeBh6QXsA6HoBXk2qOEvpadkkOJBl/qxmOCKEdo
 YmdZrBqosWNTYEJ/HlDuNfk1hoaZIaycuUroLWYqQe6uLMeg4zOtKvpo4Wd9YWtWAm5I
 sIWb9GuOWxgUizztqM90e5Pz9zbz6HK2wwgflPtGTQ4E59qlAag5w7r0sFWvbETAAnNa
 nD26tG9kIFWyG0vtOyccW1xmppO8PddX9mnat6kN4lIh8030qSQijHYbR91uD6QZc3+Z
 ulWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684847718; x=1687439718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAthNGXLDTLFcaxsW4zu97G9PTQI3Egsf4QBteoBFtY=;
 b=bPnjG8peyS8v1PCNNhga8HhutEQTv4Xjdq1DC7aFNZKAm1mOt4s5oGbtopSAVLtwfO
 Co1t/dsGy8xCRHCh+KTUtmdxeBGMGJhpY+INz+CKHjDE5IUY3Clo/fBPdmOD4yV9zDff
 rzycYLnOE8K96g72ZUE1VMA93Zh1VlJKwCei4El7wQJtFHmFhrgMsXWlztjKUgdJeOM8
 pJTdbl6OqgjizKUNaLLg6sWYN9o3IFN8G+DnRvTTMhOGoHBMxb1T6sQxJrIVyfV+QNZA
 5HOIFUl+3jU2OLxCPaKAP/T0neVnyMe9LERaxnx63nt/fJdyJSmu9oib5OW9iqiOi0OH
 XH/Q==
X-Gm-Message-State: AC+VfDws+JsxD3RuJkFGA+Fkf6uEelcTbb8Ozeu0VvTH1k9BzUPXzy0Z
 1BbZ0uOcd6KhST5HoyvqI4N8OIDzqru/lMkhvVg=
X-Google-Smtp-Source: ACHHUZ7KTF9oE7T8/4WiMrCIodaYHqKpBC3WJusdH6hQSHqcdXqYltDBhbMGd2WupaCMpxDTB9gubLMUzaAPwetXRQ8=
X-Received: by 2002:a17:903:1247:b0:1ae:8b4b:327d with SMTP id
 u7-20020a170903124700b001ae8b4b327dmr15537129plh.42.1684847717661; Tue, 23
 May 2023 06:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
 <c0932a06-175c-3294-98ec-b26e961e34c1@linaro.org>
In-Reply-To: <c0932a06-175c-3294-98ec-b26e961e34c1@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Tue, 23 May 2023 15:15:06 +0200
Message-ID: <CAO9szn3gnX62OPHp66Mm74BAOe5UCG1kOS7xub682RU7aozC0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: add fannal c3004 panel
To: neil.armstrong@linaro.org
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

pon, 22. svi 2023. u 10:55 <neil.armstrong@linaro.org> napisao je:
>
> On 19/05/2023 16:24, Paulo Pavacic wrote:
> > Fannal C3004 is a 2 lane MIPI DSI 480x800 panel which requires initialization with DSI DCS commands. After some commands delay is required.
>
> By curiosity, on which board is this panel used ?
>
We are using custom board with IMX8MM.
> Neil

Paulo
