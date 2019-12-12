Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5586C11C898
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B8F6ECC7;
	Thu, 12 Dec 2019 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2434F6EC38
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 03:13:07 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id z17so313685uac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=Aj+glER7LeT8EAq6aAjx9qYOZMBFwSK8OheF9ZlImi0MJm6E2xG6bnFOpxjMK6DB3K
 mpg9sn9TESBVOEtgwd2qxfI0mMTWzGZYIwUfMoX/qFPY6OvDe3DJew/2Qs18pgBOFFkw
 oPoF6CbIxMKhBcRqrmBdXXcakYdoJldVyAMoNGxQq4jaGSLuZEd1bZVscpvnuXfOnOUA
 2j39n0KZoRMPn7A4T6cPMn4Qlbt5pFTpRMlW2cEQteAeHspaXJautptVxdg71pciWT5O
 VzVXcRWpX/+dlbNTr/Xql8RNhhmouYv6/ZKox6+tkUZLXQWIjppUnLY2iUbqVWZ/rNx+
 ZpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=WQYBMg5flT1DJi8fXAoNbeun1zPf0eDZcAJHfjwZtbwJlKkWaHdfGveAxu81d3ElTo
 6hInqrhQxEeaknfGkLgFlPEQB6XXEQcMv6C3TZOmt4uTIMTxTGkEI1FbVoyWgtxYt4OF
 y5zuO4ySAxdWOgufSDwXv2J07a9UGuie6QFa1Q6fc6iNz0Zv3ZeEoRGhcO6UCqfm3nHH
 QSLh1XdlRjG2y/lBAuhMwgJHFtCg7tRLXIIPAqglhCci7aPlk/5tNweQ9L8g/d3yrezQ
 ixieXSTfGT1A1uLbgS8q7zXvNlv7gZ3vm92SqgCDkMTiU5Pjl/oH1K+Raeo5qNyjOz5N
 NnMw==
X-Gm-Message-State: APjAAAWW4WU3DA6PL6voeq4CQfAWl/B2NsEjJhQuUU9UaJ/0LNDASHak
 19P3UYhE8/xls0oZgOCWLqR+pFdjGyDrBhQYPOB2RfSV53Y=
X-Google-Smtp-Source: APXvYqxryrqH8RIxSyvJiL15PkO7Tyl6Wb483uVr/r84j+UhbZXhllF6v3WLAnVZh16Jz2nH+zAV5Am9Cj0A+4tmWDo=
X-Received: by 2002:ab0:2408:: with SMTP id f8mr6340375uan.126.1576120386028; 
 Wed, 11 Dec 2019 19:13:06 -0800 (PST)
MIME-Version: 1.0
From: AceLan Kao <acelan@gmail.com>
Date: Thu, 12 Dec 2019 11:12:55 +0800
Message-ID: <CAMz9Wg8FCBshrtD46+WUZA5Y7zsu_CrVw7sWhL8fjXdy5OGiPQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/i915: Fix DPCD register order in
 intel_dp_aux_enable_backlight()
To: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series of patches works well on a new platform which has a panel
only controls by DPCD aux brightness.

Tested-by: AceLan Kao <acelan.kao@canonical.com>

-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
