Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A4BB357E
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 10:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD0310E0BD;
	Thu,  2 Oct 2025 08:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXZdJk5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5610E0BD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:52:21 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-826311c1774so94284285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759395141; x=1759999941; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LgjCC+E53eFNAF26kVzyJsHWp/hhdY5/q/808WvxLT8=;
 b=FXZdJk5F/qfiSpsCdJBvhsCtNgsg17F9qRk7VsbzV3XF1lXO8iXiqxTMOS5pB8TAOc
 VpCNa2Qn2opYixDO4zsfQBuR05R6jMTrE/yRUrtjV/fp2oYakfq78WsllqOEpcaPoIbK
 eTmvbCPEJXnScffpMiVxemEDog7MQpF1boSFYGAvfLbrhHgY2lFPeT4urptiufNt6TG9
 VKUdAhjbb6w3pFCtQ1T8YYf7uVMcsspsJLYk2WEP8hUYm13oJxIH7PHhIwSa8ND5PG/g
 lmW5F74p0cmW96Irlm7bWOkqdnuV/Fmch7J8mJD/KZt/KMbSoMvxbRsNrmYElKQMVxNq
 PWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759395141; x=1759999941;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LgjCC+E53eFNAF26kVzyJsHWp/hhdY5/q/808WvxLT8=;
 b=bJ8YGD8ucz6HghyHOTH3jZzMxM3/WbCSi53RGTofCKAnk2Yl0mZFl7yVQ8Qbvl8RaZ
 EXDqb/hi/Mnib6mBPjdGUB/Ci5pmki2Cs+MIEC1E8i9Fdrl7fgjxY+E5nA8xDx64pP6e
 DNLfthNXA38Ygx7EHx1fanCiWqukbZhJ2910dax6x6h7Z0pWsQjzIsGXIvx5ToprdqJP
 9s5jlHoZctdvJZ88S/X4X+AfmmKuFXUh7tUmaYUnKL9xNXvpeFcLpti82ULNrBryhYH6
 FSl0Of54LoPRx/+1xTQ3P6WgEnl9P+/lQK/XnK3CWml9PAE43lKIr4vpW+gvUe/K9ZVB
 Wlzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRyfeBA29asKterAmOqUy6QWbiB2ubxuFE2HmtUm9Xnned/pDe8yYF3hRBjVofu4/Eyijqi47J+/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO+Jnvn67B+gX3lDNDY6zMhxVVRW+aMvydsvhJUe8NZW8pEyJC
 9uEoIq6i9MeMM+sraGbCbq/sgQwHDqjO1T6FvAfx9mtTsV9+2rojIASr
X-Gm-Gg: ASbGncs+eaV3Kz/3qd02sHadDdQPcIirVtNLAiaaPviM9uhjKcIF3pn6rnUxD0HQGU0
 WMAtK2dSwPcdEQGXErataBUubLAVb/f3XwDD7BHT2Pjjdp/Haq4zfpXSqz6x9z3iZ9dTgP2pbQr
 tdI4gt/M0VZ7W+OCFkfnaBrmUHnNSUR+OWQtfMaCOML05hyFc02fDGnPYcHXSy4vm7GIkAxD1ky
 dPNYjF2dhrQJ6eMkOvMhOlDFvKEKUS0L0Kj2re0WUc97HsmCvl9TOIgE5YhD8zKFY6NhPWb1KdB
 eFt3gIrWb0GM7K/Xy7+lc8LYbmnji3Lidwqw0uzEtLXwgU7pCXPhXnLUzLSsyLrN4rvlip5fokc
 IrmUglyg2I2bIYxlUBZwS6kcZ1UpEEFkuQ+an6vjUXirq9m8J0TE7
X-Google-Smtp-Source: AGHT+IGU7k3Fz4qxQt++XAUKwlyZTB7u2GlUklYCxfSZL0C3TLIQlcsJhzUzzlXGLVOPwzgjISzYGQ==
X-Received: by 2002:a05:620a:454b:b0:7e8:46ff:baac with SMTP id
 af79cd13be357-873705ee565mr853440685a.1.1759395140765; 
 Thu, 02 Oct 2025 01:52:20 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::9c5c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e55a34c6e5sm15894671cf.6.2025.10.02.01.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 01:52:20 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:52:18 -0400
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Simona Vetter <simona@ffwll.ch>,
 syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
Message-ID: <aN49Qt4dezOqAmoo@arch-box>
References: <20250927075010.119671-1-albinbabuvarghese20@gmail.com>
 <cb00a5e2-6e50-4b01-bcd7-33eeae57ed63@gmx.de>
 <aN1ihRfB-GHTEt_4@arch-box>
 <5ab00319-e43e-4000-8814-c7d67f384c53@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ab00319-e43e-4000-8814-c7d67f384c53@gmx.de>
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

Hi Helge, I tested your suggestions and they seem to work well.

> Do you know if this affects the selection?
> If so, would modifying (reducing/shortening) the selection maybe fix it?

The syzkaller reproducer uses really weird values where xs > xe and ys > ye
(xs=0xa00, xe=0x101, ys=0xc7e, ye=0x100) and set_selection() already swaps them
if needed and clamps the values.

I added debug prints to check what's happening and the clamping in
set_selection() is working and the values coming through are within bounds. But
the crash still happens when you remap the framebuffer because of a slight
overflow.

I also discovered that when image.width is clipped on the X-axis, the character
count (cnt) must also be updated to match, otherwise bit_putcs_aligned()
	receives mismatched buffer size and character count parameters, causing
	out-of-bounds writes.

So I changed it to something like this:

+	if (image.dx >= info->var.xres)
+		break;
+	if (image.dx + image.width > info->var.xres) {
+		image.width = info->var.xres - image.dx;
+		cnt = image.width / vc->vc_font.width;
+		if (cnt == 0)
+			break;
+		image.width = cnt * vc->vc_font.width;
+	}

I tested it in syzbot, with the syzkaller reproducer, and also manually in QEMU
and verified that the buffer switches from tty1 to tty2 work correctly.

I couldn’t find a dedicated fbdev/fbcon test suite. Beyond kselftests, do you
recommend anything specific before sending v2?

Thanks,
Albin
