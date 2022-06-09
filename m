Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB50544736
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E891124A4;
	Thu,  9 Jun 2022 09:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AF01124C2;
 Thu,  9 Jun 2022 09:19:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75F7A61B97;
 Thu,  9 Jun 2022 09:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8870CC34114;
 Thu,  9 Jun 2022 09:19:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UArqgGwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1654766363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Er+J+1CnioC8hdj/XQvRCbloD3JhuE8VxkclGA3cDU=;
 b=UArqgGwgUA80BX6wygtiHrtrGaBpi4I/llidG47Rs1pUnUVEbj2b5CzaAtabQs//Y/nebm
 idd3GoeHvSgYhOi1c6tRom4DsWoC8p05ju0dhGaokHqKXG/eMETulR9Kuan29EDI9eFtAh
 OmmGeM2ZtfSmKqo/qYaXLRqZ13bNtYE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 454bf9b7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 9 Jun 2022 09:19:23 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2ef5380669cso234430807b3.9; 
 Thu, 09 Jun 2022 02:19:23 -0700 (PDT)
X-Gm-Message-State: AOAM532a36WKabFcNvr8/UJ8xo4qNhsKoTdscMZv7xXFr7EUrJGQLJnk
 k1rsn5jWmZTQ/fRWU/T5XxlQDsDSGbDONpNJoqg=
X-Google-Smtp-Source: ABdhPJzAqE1avOsz4vImNc+NoFNBR2NTgG8AidXBx3PTt0RlNB5opM9XHUDXRrl4E82/TtT/ere1kN4UlOxz/iclkN0=
X-Received: by 2002:a81:4887:0:b0:30c:40bd:3e7b with SMTP id
 v129-20020a814887000000b0030c40bd3e7bmr42817771ywa.396.1654766362745; Thu, 09
 Jun 2022 02:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oyjj2cHjyqUrDQHQ1+YBafhBvj0utpU4kox6YK0gcT6w@mail.gmail.com>
 <DM8PR11MB5655E231601FD2195816F017E0A79@DM8PR11MB5655.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5655E231601FD2195816F017E0A79@DM8PR11MB5655.namprd11.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Jun 2022 11:19:11 +0200
X-Gmail-Original-Message-ID: <CAHmME9r=vhjhKbqGuhfa6TK=GJKx4wJ7RNHrkeW-ncEcvgHhiw@mail.gmail.com>
Message-ID: <CAHmME9r=vhjhKbqGuhfa6TK=GJKx4wJ7RNHrkeW-ncEcvgHhiw@mail.gmail.com>
Subject: Re: [Intel-gfx] i915 w/5.19: wild flickering glitching technicolor
 pyrotechnics on resumption from suspend
To: "Saarinen, Jani" <jani.saarinen@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Done. https://gitlab.freedesktop.org/drm/intel/-/issues/6205
