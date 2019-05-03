Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54A125E4
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 03:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B015589458;
	Fri,  3 May 2019 01:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7B289458
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 01:01:20 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id t1so4244001qtc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 18:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kSq919h6o1UVm1JZ8MlwKXlLHm8tsVrO94W57bvWp2c=;
 b=fOon6ePZtGQGDurjJ6R171T47KzeWV55ZIegVNoV/LAZp8T7am4un1PK9R6yOgjYJX
 vXIYaEzHMSkLJ5okMGt8655K01uIEjgj1yXP46tACdTsqlJFiZuCjE6vVvVbNeusiynf
 YGdaC4YmEIt/cs022RQt/F4M8LkYrWKIn2iADiZVemtSZojMWOpZOz7yJ8XPaXHEGegD
 spZkCkMfXi2/Ffu6KQkDngQ6yhgGig4sInrIsK0wM1Eq0I/+oiQaLRGTXZXHcybuy7+/
 h7K2aqJGBuAfVG3CUWuTCBoMspK9h9TvXztMAaA3aQveEncl99ewCzmozdsSKCCUMTUj
 Y/7A==
X-Gm-Message-State: APjAAAVhNHjz2Wf3OMcXl85m/RpXuNR0sENQay4g0DE9HJgRDqPn6IDp
 kdew7YA1vpAauwOQ/3+UiV61zvyFyWBU/fOkSsg=
X-Google-Smtp-Source: APXvYqzqwXBZzn7P/M+8oVZTQObkWlxaQtklrl2kNkDc5uCEVpqFRMYB6KzRrQ3YDHduezYJsr+W+TApCM448vZNbE8=
X-Received: by 2002:ac8:641:: with SMTP id e1mr6100662qth.76.1556845279093;
 Thu, 02 May 2019 18:01:19 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 3 May 2019 11:01:07 +1000
Message-ID: <CAPM=9twjCLCi0rVHeaK1CtyD=13PSFxdDTDK4LvV-w89Wr6DvA@mail.gmail.com>
Subject: [git pull] drm fixes for final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=kSq919h6o1UVm1JZ8MlwKXlLHm8tsVrO94W57bvWp2c=;
 b=IABV5+rCWIW/Eqn5YRBe4mVOi4tsH7WTUfyZKB1wApRm0XHxzQwVhSXab+RdYsM1cS
 /f2u46ytLnwJ23XW1QgUTKxKAi6W2h1e2Ye/k/wKt9bBi1LPcQ0CzcOEwC132j9NA7/C
 wvMe6V3X/7RHzBon8R1VTPYjD45nxI6yqcBIcVsK/QlvXh5f8sdP4zcxC/nKhjUfovox
 DXu/QsP1cjLDr1o2I7rFI+K6HTwhGMjQO0Oi8fPhQpz6tsjKw47Y9V/xDfnhNm+xYdcx
 Fm2RkwEGKJeJ+BoMaXA2rcskbgNf/g9aMyaKWMm+B0IWPIHfx4Flib+99MMPuPWpCbg5
 whjw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IExpbnVzLAoKSnVzdCBhIHNpbmdsZSBxeGwgcmV2ZXJ0IGZvciByYzgvZmluYWwuCgpEYXZl
Lgpkcm0tZml4ZXMtMjAxOS0wNS0wMzoKZHJtIG9uZSBxeGwgcmV2ZXJ0ClRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgMzc2MjRiNTg1NDJmYjlmMmQ5YTcwZTZlYTAwNmVmOGE1ZjY2
YzMwYjoKCiAgTGludXggNS4xLXJjNyAoMjAxOS0wNC0yOCAxNzowNDoxMyAtMDcwMCkKCmFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9hbm9uZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZpeGVzLTIwMTktMDUtMDMKCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byAxZGFhMDQ0OWQyODdhMTA5YjkzYzQ1MTY5MTRlZGRlZmY0YmFm
ZjY1OgoKICBNZXJnZSB0YWcgJ2RybS1taXNjLWZpeGVzLTIwMTktMDUtMDInIG9mCmdpdDovL2Fu
b25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYyBpbnRvIGRybS1maXhlcyAoMjAxOS0w
NS0wMwowOTozNjozMSArMTAwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtIG9uZSBxeGwgcmV2ZXJ0CgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkRhdmUgQWlybGllICgxKToKICAgICAgTWVyZ2UgdGFnICdkcm0tbWlzYy1maXhlcy0yMDE5LTA1
LTAyJyBvZgpnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgaW50byBk
cm0tZml4ZXMKCkdlcmQgSG9mZm1hbm4gKDEpOgogICAgICBSZXZlcnQgImRybS9xeGw6IGRyb3Ag
cHJpbWUgaW1wb3J0L2V4cG9ydCBjYWxsYmFja3MiCgogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
ZHJ2LmMgICB8ICA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3ByaW1lLmMgfCAxMiAr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
