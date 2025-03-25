Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21354A70AEA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6926610E5EB;
	Tue, 25 Mar 2025 20:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JeSFXZiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0201F10E5EE;
 Tue, 25 Mar 2025 20:02:42 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6efe4e3d698so55630647b3.0; 
 Tue, 25 Mar 2025 13:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742932962; x=1743537762; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I2faTc0N8dUSkBrVYW4gMbPX1pdfOqcvzvNOpszxEK8=;
 b=JeSFXZiyD4HvPpvu944cLzMjsvX289rYIoAmqnvvfb5PQLrHscqmVPywIXv28UE5Bq
 xPmnxkGYbmshCjyS6/9vXqo0uwcSUAtQJv7b1E8136df0Sb4vcFDpRIucFBcF6X80w/H
 Hyj5+lJJuMtqyGafHIitqUM6J88KWq+Ju0AokdPVTtc/658DpTlmQGftoLUUYFe7GoW3
 NGbIHzAr5GpIj0JgCHIQ8OpqR5TFLguynrlqlgZ9Ex0LufDnqAKG7cVmjhPK0wadQZBB
 oK79aosZ3+KbluSmD9jf90y+N29B5+RD7erTBnOY6cf+4/nLsBjJlagBnQn3TBG5A0dB
 xHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742932962; x=1743537762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I2faTc0N8dUSkBrVYW4gMbPX1pdfOqcvzvNOpszxEK8=;
 b=TDt5CYlWY+XMevIwzX/cyUSUJpdG5GMDbVoz0mp9izDp9Bz63n8Vx4Xeu/8C4X5NCZ
 c/gZMXpkSkZC/9D/MluInIcDoZ1irU4ewq22qjNsAimwF57e+mZeYi7YYXmnbd7J8uxi
 Is5BiXo1APaN41BoppO2vDzrRTPDc7KVfzzEMu622ddpFM7fDtvh/lYuwmChAZd5npoJ
 CMmn8kgULwUjWY5Ag8IPC0yI7h+Gm6Hp0mCuYqsOCVhYIp98YgYpGeGeoGXYg8fvzGvq
 5tITgQ8hMgLI8y26zmCF9ek62Q2jh8sb/MROWVQYJpJesWsXWyBORnlezPyw2poAXN2h
 6qhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4y3TDuupQAGTfDq0DXDOkXf0q5jhbFpnMTh8ZPMuOxQsK48qB1MXB0lLspCv3xaR1xx4Oqzhh@lists.freedesktop.org,
 AJvYcCWHEoS+NwNByvqlMlMnBxZktXJIl5sGUbcpyLzrQzEm3+xQ76JGwt6TjtOkRoZdm15YoNJE40q2/rc5@lists.freedesktop.org,
 AJvYcCWbp4SllS9G1QdC9DpTJ66oOraEIatifpYbi1SCKzcHGEhLrZpYMQzGFGYGzqz0o6puu8TX23ob2zrT@lists.freedesktop.org,
 AJvYcCWpN5f4IzYgQ2QajaeKd+mEfmD45OSwqm483cDtZF4iiUEDWPROAeTqD9BIb608IjzuZVmsokkfbqb8duPFcw==@lists.freedesktop.org,
 AJvYcCX31wjSudX/1ls4Kw4yGqD2dXz8oL9mbLTCy6dqmtgf1fZjCMcRHrV94oqY2DeR5IPDwtmgg4nMP7xRZBEYymio7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvVpFIYcJstsQws4oDnJwvneGBjJ2AcncjL3UINoWY5GZGUiWx
 jyACtmFcYtwLmFwxT02KV+wL0/+rVTFS+3ubz4ty6TCr0OTsfqsDgQJQH45SvT+t5G8wWQNwzce
 p7v8VQhIWjJyVPiKvIksFFAOuHww=
X-Gm-Gg: ASbGncuMe5O1eGYO/RbfCmOGrugwUpoKsr36ZcwsmmdEzfT/M2isNWmnBOxusqxWWfV
 rxqVW2R3/FL5sXo0WrpaYo0MSa91UujcnfoNhbOJgl7CUefLmbRqIueANS+ilFLrXGjC4D9CIaH
 qAgZFFP4GfwGRYPnXGSaEw4+ZQ
X-Google-Smtp-Source: AGHT+IH9GDIqWqxErm4aQOy3gdrX0Y7vT6Ol7W40H3FZP4x2c5Yyjh+qcjaKP0Q4YvCkkEHJWvv2y2zX+XaXamc7vb4=
X-Received: by 2002:a05:690c:640e:b0:6ff:1fac:c4f7 with SMTP id
 00721157ae682-700babfd2c9mr222461787b3.7.1742932961820; Tue, 25 Mar 2025
 13:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-31-jim.cromie@gmail.com>
 <0828cfdb-abf3-42c5-8500-70f36affd0a8@bootlin.com>
In-Reply-To: <0828cfdb-abf3-42c5-8500-70f36affd0a8@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 14:02:15 -0600
X-Gm-Features: AQ5f1JqaIKZ0UzULldrvJ00SprmeHiO70GjKwzUCD9IdsSYmGwkcVcHdtLPOdIg
Message-ID: <CAJfuBxxqQ3g1urkbdAhbBi=1rk7bEqo5R7xws14xY98s0t9gUg@mail.gmail.com>
Subject: Re: [PATCH v2 30/59] dyndbg: drop "protection" of class'd pr_debugs
 from legacy queries
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

> > -     int valid_class;
> > +     int slctd_class;
>
> Nitpick: can you use full words? slctd is difficult to read.
>

yes. done. thx.
