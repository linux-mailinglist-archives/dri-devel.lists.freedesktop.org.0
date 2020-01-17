Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23C140FC6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 18:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01936F640;
	Fri, 17 Jan 2020 17:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261D76F640
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 17:21:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id p9so8215512wmc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 09:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Yl2YWb4I3WdSaLwdiM2MlUHuVZ8oh3MEvyMAvhN2BpI=;
 b=pEXDhn32ldJYZ/Gdl9eMKp2DYFxmFxiSX+otOj2YLYEZxd7kFUSXi1xwf+sMkucmxn
 Ri2GkRzbq3/+7AvlmqeTvZCGg0sAPp7GLJnqygsvgBh5w/hWzUF0kTv4fswjZkMR3z4N
 Mfe9VIqwSzzovyoADr8cC/L6GGozNyRYJM1H5/xkCyh8ZV0BSuKtS+1N246Hvl7xTeOz
 VwERvvkpU8Vkngu4PZpTRgPckR+l3nqM1LUacl7jq2+sN5xcqn9bUW8xTiJt/MkBrrCN
 KImnQZTGIGVMwd2ad2ulcetMEUK4BDNGs3Iwo2mzPSQDmKl5HMlHl67rEUaqGKl6CNBU
 vPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yl2YWb4I3WdSaLwdiM2MlUHuVZ8oh3MEvyMAvhN2BpI=;
 b=hCqWOQMPFzojAx4tXY0BDDkQkwIu/Q+6XzQkTNtzgkTwArXtA8PfXb3mrB+BPJd+U4
 XlsGhCV/IaDe0BXHtT1IXwKDGGBJIzEciQFV/ODGGl088fNcudrgQRb4HVkl3Fnkev1M
 Uw2tEttBkGF4A4Tzz/pmsP8AVFgi9k38O+2tor/RMa9e++DOWt2FMct/mqKEGAjCn2ce
 09YHq1z1qMLlyXaDK3WunLfgWD1at5ibVDRDrha8ijhP1Bbla4szO0ifhByi5Yv5VgX0
 K00aOJFE93DOiz8PwbWtVHNrrQsprTrOHaIngpkArwj85WfRlJ4F0Nm/zdCRdMC2Lwp8
 NGBw==
X-Gm-Message-State: APjAAAUNx0zKBnEbVHfnpL0mOLoygnslwZFkE+WPWs4ejCwWWywedN17
 DQnh+SXAFHtEF6XmFrX/oz7gznxJ
X-Google-Smtp-Source: APXvYqwyEtEw8TDuGmgqiJi+L7IOtYNhLxlot5WjlVJwSoKOhdnkn2JPkIkc7lR1dQa7HJVhpm1ZpQ==
X-Received: by 2002:a1c:9a84:: with SMTP id c126mr5827629wme.111.1579281670772; 
 Fri, 17 Jan 2020 09:21:10 -0800 (PST)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id v62sm1668882wmg.3.2020.01.17.09.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 09:21:10 -0800 (PST)
Date: Fri, 17 Jan 2020 17:20:40 +0000
From: sylvain.bertrand@gmail.com
To: bugzilla-daemon@bugzilla.kernel.org
Subject: Re: [Bug 206231] R9 280X low performance with all games
Message-ID: <20200117172040.GA31322@freedom>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
 <bug-206231-2300-lyYmzPoNN2@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bug-206231-2300-lyYmzPoNN2@https.bugzilla.kernel.org/>
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

Owner and user of tahiti parts on amdgpu with a state of the art gfx stack
poping in.

I own "rise of the tomb raider" which gnu/linux port is vulkan only, and vulkan
is only available with the "amdgpu" kernel module (as far as I know).

I have not bought "shadow of the tomb raider", which is vulkan only too (the
port was coded by the same company).

I did clear "rise of the tomb raider" years ago, I cannot play it anymore
because the driver seems to miscompile some shaders and does gpu vm faults
(from my save file). I did open a bug.

I heard 'southern islands' parts (tahiti...) do suffer from a critical "mip
mapping" slowdown bug. That could explain the slugginesh of those hardware
parts in 3d intense games (I did almost stop playing "rise of the tomb raider"
because the 3d rendering was unpleasantly not smooth enough).

If you want, we can try to compare our benchmarks?

-- 
Sylvain
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
