Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029002A21B5
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 22:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD1D6EB6C;
	Sun,  1 Nov 2020 21:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6836EB6C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 21:07:31 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a9so12278464wrg.12
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 13:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u/bFnwFY0CkKUNKU1mbdYX9tXmpMW9ERYi9Xq9y9Uv8=;
 b=rM+fh5JmowtlcRuIXXXV4O6pDEHEx6xdgTJ8esXTMSUyxYLq9nXi3igDslqzhXYVvi
 8cd9nk1Mu4JJvkFPLEdC+FJWdHbiako3tur2Um9ugrGpKxMYWNELvdLdzPjsr+qZRQbP
 YbHUWlNNXVqzXBS6IoSg6nxCykcBRDFNOGXAbuk0DJDK/iDzkUk3xzgTf1CUZE0WdOTU
 oGqa5a8MWtEr5YcrGl7R0dQDOO4DF0+v8A8BP1EVMGDyTyXsgY70on+1Fz/2AfBfZUpn
 iZQcc+KuiJkUkiISPVFgRduCNrk7mv7m1v8Vjze1pZInCxI7oWXRs3XKpjcbWbmbDhYo
 mPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u/bFnwFY0CkKUNKU1mbdYX9tXmpMW9ERYi9Xq9y9Uv8=;
 b=ccT47XlHx8Qm/K5C6agUXjpi9s4ZA3i/cpNC3tZXzvdv7Ou+dnB6GMbM2eVmxhTAO6
 NQrhYNv55aWyPeE9eI44TGJTFD21Z9MBOxZaaMshj0hY5tUh2zAvdsH6SWpL1ugYkTPE
 LQEvvvz4kRPlrAPVf6kA0MivW+0dYw6oKxwEVvrTDJjwkz9W1lLV4TcEQJ67S/WYKGMj
 RS+3ZMQygjfurIdNpTjWMRPqai8tf72Vvh9UsIbLBc7nXneTJa3gJvgpEp3o1xzHwGTG
 OEx7KZvabM2Qt2kFKRI/iY4UukJf/TcHUnKZUmAuhEcCor7EIZPvdLU43nST1JJNM4k2
 yUnA==
X-Gm-Message-State: AOAM532Osky916x0AC2blmYIUJIWjxNhW6u4aA6fH4eYgZvC5aKt3qKE
 sNF/ft0aEx+ebU68qJQQl63Y01SohV/G6tGcOSaM5OQO1+vvJlJh
X-Google-Smtp-Source: ABdhPJxFixOWgekrBmUJPb1Np9Ep9HIu8cUiBTeoqPifYlZd3jsRqVR71k0FnoqSP3IbhLhw+6MzbqJz4jGTc/630rA=
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr16048611wrm.373.1604264849778; 
 Sun, 01 Nov 2020 13:07:29 -0800 (PST)
MIME-Version: 1.0
References: <HNBtgIoryEkrMD_i_O5qy-HyxoyMYWSziPwHQQn9LYoOL8Ds5o7gvqMqz-Y0v7GZDqcYzBLC3d3KPfO37nRCl1doMWeQjKyHYv_pYFxYZ24=@emersion.fr>
 <qhVMa7YWDnEiufs2_tBn6d3idpWpj2A5cqvDHL94SdZeGfVsdZCdlKlKGKRN0MfJDGZ4PJthZ86C1Xqncp7jcdiEq2eKVMLFIm1uAKRDEkA=@emersion.fr>
In-Reply-To: <qhVMa7YWDnEiufs2_tBn6d3idpWpj2A5cqvDHL94SdZeGfVsdZCdlKlKGKRN0MfJDGZ4PJthZ86C1Xqncp7jcdiEq2eKVMLFIm1uAKRDEkA=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 1 Nov 2020 21:07:18 +0000
Message-ID: <CAPj87rNaL8Uu+=QVwQRRpS3r1LL1sPsQZpgpowm-HZ3Z=hMYLQ@mail.gmail.com>
Subject: Re: [PATCH] drm: document that blobs are ref'counted
To: Simon Ser <contact@emersion.fr>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 1 Nov 2020 at 20:35, Simon Ser <contact@emersion.fr> wrote:
> Daniel, does this patch look good to you?

Unsure which Daniel you meant, but I would probably instead say:
'Userspace can release blobs as soon as they do not need to refer to
them by their blob object ID. For instance, if you are using a MODE_ID
blob in an atomic commit and you will not make another commit reusing
the same ID, you can destroy the blob as soon as the commit has been
issued, without waiting for it to complete.'

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
