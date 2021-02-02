Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C2230CA91
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 19:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB646E990;
	Tue,  2 Feb 2021 18:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193636E990
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 18:55:40 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c12so21612220wrc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PKfKFK/2ProzFqr+vmCD2uLhPeTM/j0zo+f+aWKxocU=;
 b=EhRefRXNMn1lSvlpMx1Dy6uUN3CMIZ7wZsVnIkIQ94FOWW6deWnkxHo571/NYeXfEC
 In+nuBUZBzd/FVeSiUPR1tLVlByHFesnrXSD7aqqsAs8cCP3Vd1Ze7b8R6ivkn0oUpJt
 TL9nNpKrCGUiBfNiXQZwteoIYbYEVeAvi9XRt7A4vpfaJz3S1qLFHPpvdr87uAnCOfZa
 nX0Cf51bkiQRfs17upN53QJaSqmTXAUelPdwUhs+xxav3zP8PhZbw1g+UtP7HERNbnqD
 u/p8CUBdzIJ+cDJtzdwGaNkZZjj7zYoxtyaVfzvKVTo+TgK2MzrUMe11eG0RjSMqWV9r
 esCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PKfKFK/2ProzFqr+vmCD2uLhPeTM/j0zo+f+aWKxocU=;
 b=tDt9Xzr/9XuUwr7O5akfiKeQ3RoiOCia+m9zw8vaKbxpK15UM3/vEibnUA50idtF+l
 qmS8TJXcTnHU+Pa4Xqi3eRNpiilexy+X7R1ySJddB9qNBOE5LYb4+9rixpeMUFKOtgMu
 nFg6y4Jnrg4vDfQasRWuasjzaA3r0iuGGO0NRV6NWcosGf1KpmnC34p54Mtux6RQGQId
 4mdHxulqFJiHHPwXk5Evm9n1TL4MEu8F/nVR0ifFdP5UIJN0L7FN2tRbzirJ1zygDyXE
 ivxjvKkU3sJ85kwT4s84WFh3npkhK79CC0e+HlqHgD9ErjLqichBVJYrb60GIocnqKre
 0OLw==
X-Gm-Message-State: AOAM5313YSBEca+AzMoHe93JrJN469449YlpW5LYluPaH9S217yUsdKT
 iniDQuQAdG9qgtw/i+1gNLsJgJ7S13HCbiF5U0fDfLfaPyu5vqpe
X-Google-Smtp-Source: ABdhPJzuu298h/APraN9AJqKJAAvwVJ0HTJJ70w3YRHa1supe5bYPjW/PdhbpMnMmOONy1IHqaiXT9bRpx8SR3Pc/sE=
X-Received: by 2002:a5d:5005:: with SMTP id e5mr417652wrt.82.1612292138369;
 Tue, 02 Feb 2021 10:55:38 -0800 (PST)
MIME-Version: 1.0
From: Juan Fernando Diosdado Ramirez <fernando.gepp.cr@gmail.com>
Date: Tue, 2 Feb 2021 12:55:26 -0600
Message-ID: <CACCisJUHVPTrvv4HOeVxc6Kzm-rfin37BZZT_F5wMBW=t9SU6Q@mail.gmail.com>
Subject: 
To: dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============1576743155=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1576743155==
Content-Type: multipart/alternative; boundary="0000000000002e863705ba5f042a"

--0000000000002e863705ba5f042a
Content-Type: text/plain; charset="UTF-8"

Ayuda

--0000000000002e863705ba5f042a
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Ayuda<div dir="auto"><br></div></div>

--0000000000002e863705ba5f042a--

--===============1576743155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1576743155==--
