Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798C7141E82
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2020 15:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5776E3BC;
	Sun, 19 Jan 2020 14:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EC76E3BC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 14:23:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d16so26907141wre.10
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x3jW4mEyJmcw6V/nGmVs3Agva+g1L3GldcasTdtsC1E=;
 b=G+s/DzVyyZ7q3oa7MCh5wZADTXasR0eCVVtq83eCuy+HStZ+MMgTHh3PKqW8eHp3G4
 W35H3G1+eip0Irzm8zfJN4smJ3rFiQoc9WgqrFLUrTf0aRWUQwg3H8rdSwN8Bnik0h8C
 VxJv7E/CO4RGhLw1T45MHtp0yGIuaNMhwrBcbh2feyHmi0KZbk6p9qd4nYnn/1MpHRE7
 n0enUsDvU7TSwH5lHQcWuG4KZfLSa8pBzUJViy3p0Im4Zj/YDjLMJyhTaBsM7DjG0xl8
 6bZgOZGP39hTcWr8/bp+S+vNMApf1mi3sBYI+fagKX3gI3K6kagFleAI17gQWVlsODmQ
 kG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x3jW4mEyJmcw6V/nGmVs3Agva+g1L3GldcasTdtsC1E=;
 b=b4GpFuDVOoKNegRqSm+QMpf+YqKD9tYYr+RupQ+rEda13TOXypxnfUwsv23Kmhp2Xt
 G1NKDvnR8xPd/IBm0ZFhGKNFis7sEVMihGJJWU6Erw0s/syrNBNLmBcxuN8cpnQmslDy
 2d5lVhjhm21Q0nAvJr+Q67BG5TpuKfVwP8txstwuUsZnFqdpvC6A9/6HEtSQRH3kalaQ
 DybNl4pfF9HSG20qxQhcEK3ijbn0L6djdxm387W93bdzV5qPXzhVibGWjkjMCMj9VQ/i
 alb0OLtnwR/ZGWpzwdBPNNvhcd1KfqPeHxUtF5i7bPIyLvPisW1CwrSaDD++HRMCxMR1
 hUhw==
X-Gm-Message-State: APjAAAUoYn5EhrYFan0s2Fm/0KQTIJ+nERRCByGRc2ryCe31nhmtU5O4
 zMn2e5wQ5Tumgfql2jnKfqL28hi9
X-Google-Smtp-Source: APXvYqy7QNk3BHiWPINeSf29SNRBXZKGJXZ1sz6ks+k77RRpqqv/yXOLkqni+3dSMLjqEq9yRS9poQ==
X-Received: by 2002:adf:ca07:: with SMTP id o7mr13275178wrh.49.1579443786528; 
 Sun, 19 Jan 2020 06:23:06 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id f127sm4843085wma.4.2020.01.19.06.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 06:23:06 -0800 (PST)
Date: Sun, 19 Jan 2020 14:22:31 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200119142231.GA24190@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-2yWJq7EzV1@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-2yWJq7EzV1@https.bugzilla.kernel.org/>
User-Agent: Mutt/ (2018-04-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 19, 2020 at 01:11:15PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> Tomb Raider: https://youtu.be/0olpvLBH9DA

Indeed, this is obvious here

This vid rekt of the mip mapping hardware slow down bug... but I may be totally wrong
due to the insane complexity of the GL stack.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
