Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062757BF32A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 08:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F76810E19C;
	Tue, 10 Oct 2023 06:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0643910E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:34:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BC2A61517;
 Tue, 10 Oct 2023 06:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2F8C433C8;
 Tue, 10 Oct 2023 06:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696919656;
 bh=dQkrwgbVocyStNG+wztd+ijksIIgK9fPEm9nKavB/1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cPs+1DpzEHlU66F/axWpFTLecuCC/Fi5sZlVCJpVmIHvmfYXq64FESX6r7xbqo7yC
 JY+68qFve2kFyyd+5cHEiG/ByNxM2cTYp95VDitXWHTDB7T7P+nGEWODCIggjU74YD
 w/kxlDmVn88KsJtkcZlpGy5yQfl7JFdivd7njL68=
Date: Tue, 10 Oct 2023 08:34:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH] accel/habanalabs: make hl_class constant
Message-ID: <2023101053-clambake-mollusk-2953@gregkh>
References: <2023100654-pointless-stem-5ee1@gregkh>
 <CAFCwf10o8J2JYue9Spc0qmSnH671ySuDeUggJ3J6mhXVTc7kTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf10o8J2JYue9Spc0qmSnH671ySuDeUggJ3J6mhXVTc7kTA@mail.gmail.com>
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Dani Liberman <dliberman@habana.ai>,
 Koby Elbaz <kelbaz@habana.ai>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Tomer Tayar <ttayar@habana.ai>, Tal Cohen <talcohen@habana.ai>,
 Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 09:07:53AM +0300, Oded Gabbay wrote:
> On Fri, Oct 6, 2023 at 4:57 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > Now that the driver core allows for struct class to be in read-only
> > memory, we should make all 'class' structures declared at build time
> > placing them into read-only memory, instead of having to be dynamically
> > allocated at runtime.
> >
> > This requires some passing of const struct class * around in the common
> > habanalabs code as well as converting the structure itself.
> 
> Hi Greg,
> Thanks for the patch but if you look at our tip of habanalabs-next
> branch (to be merged in 6.7), you will see the hl_class related code
> no longer exists, as we moved completely to the new accel char device
> class.
> So, I'm dropping this patch.

Ah, no code is better, thanks!

greg k-h
