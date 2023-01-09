Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9256621B0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A898A8926F;
	Mon,  9 Jan 2023 09:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C840A8926F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:36:30 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Nr82x0sgkz9sVy;
 Mon,  9 Jan 2023 10:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1673256985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DHGwQTJogrkrprhenB/eaOfX2pHteJxHN4Al9I5d/M=;
 b=MRtE9IqwYPSEup2u8OcWyOjd3xBgnJ2Y/1AxHrXEQU9o0mkd7iUmT8sl5JV63F0k5wUgR1
 UhpjdbT5EwZTHMhUvZapc1WdKn6z+EfevdSN2YxCbGjIIQ9Wp5qqMCH65EpZ5/FBg3dQgP
 FU8TPcIyFZww09CHlvJoQ/rwFfqytR7btBfgo4C1evEbnQiAoB8Hcqr7/EGpP6BEGBrR5c
 dWkN9M0ClELogoJTv3DmbQri4DfIy4UA6mphV49TYRIrHdeHpO1CBgjnHkFDWxeryWakyq
 FbCC2Yw7KBfKCC7j4OPXUAqdYSJpP0rdcu0cDbL7dAJelPCU8szKh4MnpFIoMw==
Message-ID: <bc274046-0db0-462e-340c-3230a4878315@mailbox.org>
Date: Mon, 9 Jan 2023 10:36:23 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/vkms: Add a DRM render node to vkms
Content-Language: en-CA
To: Yi Xie <yixie@google.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230105052325.514970-1-yixie@google.com>
 <Y7a2Viw/1RUNCGkD@phenom.ffwll.local>
 <CAHf1YQ4AZoOd=Q7KVqb1gQm3=TtiS_8-uxFY93syov1AgUT=CQ@mail.gmail.com>
 <Y7bVNT0sf5cwEHuj@phenom.ffwll.local>
 <CAHf1YQ55f2mN14ytCz=AB=VSvO8ByKoV59dF50gWVcjcgMkTHg@mail.gmail.com>
 <Y7bbxVzhYCGhCvVN@phenom.ffwll.local>
 <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAHf1YQ4jHeCGqoERpYM6yX8-9pjqiemUN3fT3fpweDTZz6Mrbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: e1cg443o4suh71eesmymq7nhk5d51n51
X-MBO-RS-ID: 4d3769859fd05e03784
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
Cc: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, dri-devel@lists.freedesktop.org,
 lepton@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/23 16:16, Yi Xie wrote:
> On Thu, Jan 5, 2023 at 11:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> Ah ok. For next time around, copy a link to the comment you want, e.g.
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/5830#note_582477
>>
>> The 3 dots menu on each comments has an option to copy that link tag. That
>> also highlights the right comment.
> 
> Thanks for the tips! Actually you need to sign in to reveal that 3 dots menu.

The date after the username at the top of each GitLab comment is a clickable link for the comment as well.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

