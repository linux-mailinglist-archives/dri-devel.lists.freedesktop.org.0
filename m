Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1F6835BF6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 08:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DD710E60B;
	Mon, 22 Jan 2024 07:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D62C10E60B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 07:46:56 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-7d2e007751eso804995241.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 23:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705909554; x=1706514354; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HBXWEKVmZuP2+wpPYTROVFhUSFjvWgY133QFkVQ5+ok=;
 b=i6PnMPbjOodlj2LsIUyz7PIo/6dlSbLnZ4TQp0tvyIUKXLbJ0floY4c7sMzZ/S8aKV
 q/9j96xGullvkSUowy/juVJJahdmDJGWiU7E9v6FacvcS+gBQrxeWDDYTy1tOERenfGM
 IWQO2WmsIG5YcaUZXOOs9qMD1snz5Pdb41kGJe74N3OtcX0ZXDDT7Vb7CmV4ZIKLEDfz
 MAjZe/vSAnylvx5Dqhnr0X2mdVrh92+RAgSJFtgO2mrIOf3LGxZ+N30DWm8Gny0hAx21
 sxF066wjUH1Vv5UdqD+iOvb6o6TLvU8X92Od4GaPZehzW8Bp7tS69E+iIx+nIDMYY/af
 FpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705909554; x=1706514354;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HBXWEKVmZuP2+wpPYTROVFhUSFjvWgY133QFkVQ5+ok=;
 b=qMii3yKu5EXGyHwhnMM4ilIi+nzEleAwKHW3ddOXx3Dycsr/Rm5lJlWhQb6KfChFXi
 40y2RDuBDwECTvfvdRrAlDTU4FIS/gxPb9C9TrHj/80A9Q+Xc8EDDi1R7uk+L1Lts45E
 dVsoRXOPecGWynBOeYMThLT37W9n4uTRiKrAA0fgzp2et1QjgZoeyEegVg3sM9RRcekk
 cimnAPhHRPUzeGBQPUncv7ihNLQ+uVLyK+ozMZaJFSg+7gyFCVLX2QQOF32yZ6xBgfaW
 3MWEX9QyQX2bL7fn234/AnYRKmaRJuZrf04CttMVayjx1gIBk0dYGxj8hysV7R2tCBi9
 JMiA==
X-Gm-Message-State: AOJu0YwrpL4sF9EOZFKmJLoQKqu9bmTW8Kvc3SGZqGWBJC36BWli0UL5
 sGt/KaLR68/CZatxFS0UqJa1TIjo+yIbvodZ+zxjBdaPGoEb2N8aYigBP4gMs94ArdGggdE7Wy1
 UiJpyiS5KJeUB7lB0PxoY642UcKrExYVYfoRaiF7h
X-Google-Smtp-Source: AGHT+IEoGSoaggZBEX7B8lD7dc0jnF08Dque+ENFRng7Y+P6DCAXWgLICPSbq68+Qfq1YHG0y/hOcducdC6ayCw/YcU=
X-Received: by 2002:a05:6122:1191:b0:4b6:e611:4406 with SMTP id
 x17-20020a056122119100b004b6e6114406mr1094650vkn.1.1705909553661; Sun, 21 Jan
 2024 23:45:53 -0800 (PST)
MIME-Version: 1.0
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 22 Jan 2024 16:45:17 +0900
Message-ID: <CAAQKjZOa=nP4x5txKb_GZbns-98JFpXdzYPC7F1Z-sR==f6vdQ@mail.gmail.com>
Subject: Inquiry regarding the use of the dim tool
To: DRI mailing list <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear all,

I'm attempting to make a pull request to the drm-misc tree -
drm-misc-fixes branch - but am encountering an issue as follows:

daeinki@daeinki-virtual-machine:~/project/mainline$ GIT_CURL_VERBOSE=1
GIT_TRACE=1 ./dim push-branch drm-misc-fixes
15:53:53.966461 git.c:344               trace: built-in: git version
15:53:53.975543 git.c:344               trace: built-in: git
symbolic-ref -q --short HEAD
15:53:53.985852 git.c:344               trace: built-in: git remote -v
15:53:53.990337 git.c:344               trace: built-in: git remote -v
15:53:53.994804 git.c:344               trace: built-in: git remote -v
15:53:54.001999 git.c:344               trace: built-in: git config
--get user.email
15:53:54.005279 git.c:344               trace: built-in: git rev-list
'drm-misc-fixes@{u}..drm-misc-fixes' --first-parent
--committer=inki.dae@samsung.com --no-merges
15:53:54.011711 git.c:344               trace: built-in: git log -1
437eea2a59f193be9dee439b1f483b8f8e44e56f '--pretty=format:%H ("%s")%n'
15:53:54.015629 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f '--format=format:%an'
15:53:54.019062 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f '--format=format:%ae'
15:53:54.023306 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f '--format=format:%cn'
15:53:54.028380 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f '--format=format:%an'
15:53:54.034737 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f '--format=format:%ae %ce'
15:53:54.039538 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:54.042555 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:54.044988 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:54.048174 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:54.051992 git.c:344               trace: built-in: git show -s
437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:54.056200 git.c:344               trace: built-in: git log -1
'--format=%B' 437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:54.058814 git.c:344               trace: built-in: git log -1
437eea2a59f193be9dee439b1f483b8f8e44e56f '--pretty=format:%H ("%s")%n'
15:53:54.062107 git.c:344               trace: built-in: git rev-parse
--verify -q 20c827683de0
15:53:54.063871 git.c:344               trace: built-in: git
merge-base --is-ancestor 20c827683de0
437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:54.609416 git.c:344               trace: built-in: git show -s
20c827683de0 '--format=format:%s'
15:53:54.612067 git.c:344               trace: built-in: git rev-parse
--verify -q 0c14d3130654
15:53:54.613680 git.c:344               trace: built-in: git
merge-base --is-ancestor 0c14d3130654
437eea2a59f193be9dee439b1f483b8f8e44e56f
15:53:55.665041 git.c:344               trace: built-in: git show -s
0c14d3130654 '--format=format:%s'
15:53:55.669444 git.c:344               trace: built-in: git rev-list
'drm-misc-fixes@{u}..drm-misc-fixes' --first-parent
--committer=inki.dae@samsung.com --merges
15:53:55.672323 git.c:344               trace: built-in: git rev-list
--count --no-merges --first-parent
'drm-misc-fixes@{u}..drm-misc-fixes'
15:53:55.674971 git.c:344               trace: built-in: git rev-list
--count --merges --first-parent 'drm-misc-fixes@{u}..drm-misc-fixes'
15:53:55.677152 git.c:344               trace: built-in: git push
--push-option fdo.pushedWithDim=this-was-pushed-with-dim-and-not-manually
origin drm-misc-fixes
fatal: remote error: access denied or repository not exported: /drm/drm-misc

I've already obtained the commit rights[1] to drm-misc. Following the
guide[2], I've completed all the necessary setup. However, I'm running
into a problem where the command `dim push-branch drm-misc-fixes`
doesn't seem to work after I merge a patch using the command `cat
1.mbox | dim apply-branch drm-misc-fixes`.

[1] https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/569
[2] https://drm.pages.freedesktop.org/maintainer-tools/getting-started.html

I'm still not quite familiar with using the dim tool. I'm sure there
must be some aspects I'm missing. Could I please get some help with
this?

Thanks,
Inki Dae
