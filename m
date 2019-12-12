Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6113711C8A0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8956ECD8;
	Thu, 12 Dec 2019 08:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583ED6EC38
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 03:09:12 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id t12so522739vso.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=n5B6JDqi4FIIEtSiMOkaxP7VF9lAMdZbx4I3ldY8oxkg7mSIwXWrtrSEQetuicULDq
 kZEap+H+pigREdOnCiQ8qeTyW6mTxtEgaeHae8+sS905Ma6kE15f3RGGBYGAqhBTKExj
 MLPrptW/0yQ/53NoG2iDTgUOz0SXPW8OKQwrkWyryuXE1vFGaTdO5a5UgQdFekMt08fx
 m+hAzGWqvknJigMbtPndNdfpiNMyKn+CyXBYlujvGHoNKXBJOP+o+q8UEjf0zEEvTg4D
 C94arzeW3o0d2oQE0jtkjOW2pz5aKw0Tm9HP1MxKvqtcnyVfaetoKqEp4WeBnZXom3ig
 QOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qFy+H7kpLOQCi2bXrFGLfTS3hB32HkInVCl6xfT8dpg=;
 b=mi9S7EvyQ8iiBBqGEzg6vXogJzb2H01xlAGbud8G6a9HkL2sO3O9/wRYvfmm0oBixD
 cY8UTtvIg7GRpJd/ZBJQdCPh7Hm4pdg/NIGvSXn9vxBUL0KXjtMyNeL7v0gfqSxvyoMK
 V0PGq0ETBIM88IDYJbgyd84dU92n7YGR2KpY6Zkbt9tUPjJ1kuCcHyOsMv4L+foFRsjM
 rYkvAakS18DAQlFSuVg8hvVkZZHLwSYnOZKQDwFcbzn0nKyKRTMHCEZEMzECOaJONhWa
 cA7Nl6o++RfA4rrV70Kl1kBuHqL4bkbKom/aEg+LOVRZkhO4PjHTN5eFc4T4R0fukjnj
 Hn4w==
X-Gm-Message-State: APjAAAX7QdjddlBXBuW3G5GQgaZCsWQpA52rmfs7TfB/43Nz1dsr1d5S
 rmoeG8aJ498kUih2pzfaLUdAmjFfweT66g65K8GAzHOH+hM=
X-Google-Smtp-Source: APXvYqynh2yqp4cpdWJf/LxOqg77/qNdkodE+W74zrjkDbnkT3ACcHtN7gWdwEK95iXy5Ms77Dz57ENa45EPfYod/GM=
X-Received: by 2002:a67:f887:: with SMTP id h7mr5125192vso.56.1576120150715;
 Wed, 11 Dec 2019 19:09:10 -0800 (PST)
MIME-Version: 1.0
From: AceLan Kao <acelan@gmail.com>
Date: Thu, 12 Dec 2019 11:09:00 +0800
Message-ID: <CAMz9Wg9tNjYbRyHKRazu8LTSo2AvEn38zxHzkNJxJw9XmjxwqA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/i915: Fix eDP DPCD aux max backlight calculations
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
