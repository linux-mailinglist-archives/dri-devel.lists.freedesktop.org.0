Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE45F72879A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 21:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F8910E60B;
	Thu,  8 Jun 2023 19:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBF110E60A;
 Thu,  8 Jun 2023 19:07:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C91FF6507B;
 Thu,  8 Jun 2023 19:07:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AFDC433EF;
 Thu,  8 Jun 2023 19:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686251252;
 bh=GCMwx5k3Bt73ybwU+xYV6fYC/0AQ7aBIYHCUpkvNKfo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=IMVbHFLxBjjj08+tTY4mqBYXPu+yPkr26OZEBnmqwftRD4Q1SIAVbxtVB+RaEhaTB
 9YNpxhOb06DUNpsGWpqlO8z9M/UoGEk2AM7sufDW3RJNemcOsnAqYtglNCuAJpE+kf
 JUNbc9ZTxw7AcQ/hSPwWfQdyFV4yp8l+IAq+TPrnPI702kcblJyStDWHqfH3yQj13S
 t0Qutj14xL88vuhjZ7Z7pf9c2BxwZj+zB62b8uEzHzrF0cwWx7KsTwLNS7kF2x5DgT
 9sI7zqmisychBq+ZtaxoiQBolhnEvyYOtA7a5hsVEwn9EOwYNv2+9Uz/yX7pGykML/
 Wog9TxmEmNR5g==
Date: Thu, 8 Jun 2023 14:07:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [Intel-gfx] [PATCH v3 1/4] PCI/VGA: tidy up the code and comment
 format
Message-ID: <20230608190730.GA1209607@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608114322.604887-2-15330273260@189.cn>
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capitalize subject to match ("Tidy ...")

On Thu, Jun 08, 2023 at 07:43:19PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> This patch replaces the leading space with a tab and removes the double
> blank line, no functional change.

Can you move this to the end of the series?  The functional changes
are more likely to be backported, and I think the backport may be a
little easier without the cleanup in the middle.

>  	/* we could in theory hand out locks on IO and mem
> -	 * separately to userspace but it can cause deadlocks */
> +	 * separately to userspace but it can cause deadlocks
> +	 */

Since you're touching this anyway, can you update it to the
conventional multi-line comment style:

  /*
   * We could in theory ...
   */

And capitalize "We", add a period at end, and rewrap to fill 78
columns or so?  Same for other comments below.

> +++ b/include/linux/vgaarb.h
> @@ -23,9 +23,7 @@
>   * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>   * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS
> - * IN THE SOFTWARE.
> - *
> + * DEALINGS IN THE SOFTWARE.
>   */

Can you make a separate patch to replace this entire copyright notice
with the appropriate SPDX-License-Identifier header?
Documentation/process/license-rules.rst has details.

Bjorn
