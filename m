Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CA80E461
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 07:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC5010E0C2;
	Tue, 12 Dec 2023 06:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935C210E0C2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 06:41:40 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5c08c47c055so52352787b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 22:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702363299; x=1702968099; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YKE2zuLzeQJDcIXSdKzo06j4Otoprc4M3hYEaOW4B8o=;
 b=ppKP/tWhFwo+mfmg4kdtJOmdcaSWNkOsQ0LElbvCItuvFtlVOjZ8Yo/yy+sqr6nmPC
 FWXMmYXG3IM87EHays7ox11jylla6ADpiQK7ukvdDdiBnCgG7Pq85vbcY7vG3ZmXuqsY
 o7sm1lXlP1UEYVJmYsZBDX1hufWhW6DNMxmtckmw9RfR6NIy/TlfgeZuFvIdzxxas1YB
 Ux2bXljsToW4FV5Dznf13w0lHR/APrPm9y8AsoXZdb/9SAHyVPu7CLHR77YW1vtzzD0j
 4xJ0VYsuIQUSD4vqzpUvNazZGeqjwqCHFR82jrN9y+21p9xnRaRPChxVJ1tJalYtZfdL
 nLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702363299; x=1702968099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKE2zuLzeQJDcIXSdKzo06j4Otoprc4M3hYEaOW4B8o=;
 b=fQiOESNfUbhReX+LJjbAB2TVy1sDI1gvW+pP47GtQ860nlM7h+BEt1j/5fMSMVIM4E
 nrjxbo5BfAJ2yoa/Lb9UoDDZeBlt/l7lHoRjviRGEGkKlYXSgfIRHeKy6nFXO8mla3Yl
 31V5kHnh3sqmiZWFV+qHkSc0C7FAXaWzsZrOs3QBP3LWeiBNUxXk7hQykzNWmre0H489
 z7XnZfZuLFPMJGM4lY8ggY5o4eDtUX8PK04SF1ODp5vF61KdXVfTbJEltOTNT0xoYEdw
 oNVfOqhAOi7Vt4NeRSv84WD6p/CKSdHeTrc6jDtRsbB+ivTQybSAZogx/WzseNApaH7A
 7Ifg==
X-Gm-Message-State: AOJu0YzvnYMK0NFe6Ahvh5QZfKIW8qiscxgf9Y9jmrFvdMEXrSNJ/Sa6
 gnGr7jjN4LfatDCiMrjxRhR6a2rJU+KPyQfZw0iwvw==
X-Google-Smtp-Source: AGHT+IHm3Elev5sOzSSZwb12FUilvp/T+04Oo2vDTg0/IFFD3ZcM1sD3HEd7qlZ80V9IQ6FD9RbDvwFmQqdbl1lMypM=
X-Received: by 2002:a81:8585:0:b0:5d7:1940:53c7 with SMTP id
 v127-20020a818585000000b005d7194053c7mr4579131ywf.63.1702363299778; Mon, 11
 Dec 2023 22:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-5-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-5-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:41:29 +0200
Message-ID: <CAA8EJppjMhqJM8svtFECPJHRYvG7uSY6GB=Qe04q4hCQRNQZjQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: move csc matrices to dpu_hw_util
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since the type and usage of CSC matrices is spanning across DPU
> lets introduce a helper to the dpu_hw_util to return the CSC
> corresponding to the request type. This will help to add more
> supported CSC types such as the RGB to YUV one which is used in
> the case of CDM.
>
> changes in v3:
>         - drop the extra wrapper and export the matrices directly
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 30 ++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 31 +--------------------
>  2 files changed, 31 insertions(+), 30 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
